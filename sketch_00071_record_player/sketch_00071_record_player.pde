///-----------------------------------------------------------------
///   Name:           sketch_00071_record_player
///   Description:    Minimal audio player, example recording from The Conet Project: https://www.irdial.com/conet.htm
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 17th, 2017
///   Notes:          Example recording: https://www.irdial.com/conet.htm
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Audio library
import ddf.minim.*;
 
// Audio library object
Minim minim;

// Audio player
AudioPlayer song;

// Audo metadata
AudioMetaData meta;

// Play or pause
boolean play = true;

// Action string (play or pause)
String action = ">";

// Directory where songs are stored
String songDir = "songs";

// List of songs in song directory
File[] filesList;

// Index of current song
int curSong = 0;

// Set up scene
void setup()
{
  // Set size of image to 500px by 500px
  size(500, 500);
  // Instantiate audio library object
  minim = new Minim(this);
  // Create file object to list directory
  File dir = new File(sketchPath(songDir));
  // Instantiate list of files
  filesList = dir.listFiles();
  // Load current song
  loadSong();
}

// Draw scene
void draw()
{
  // If song isn't playing and play is true increment current song
  if ((song.isPlaying() != true) && (play)){
    curSong++;
  }
  // Draw black over background
  background(0);
  // Set fill to whtie
  fill(255);
  // Align text to center on x and y axis
  textAlign(CENTER, CENTER);
  // Set text size to 20px
  textSize(20);
  // Draw index of current song
  text(curSong + 1 + "/" + filesList.length, width/2, 200);
  // Draw title of current song
  text(meta.title(), width/2, 220);
  // Draw author of current song
  text(meta.author(),width/2, 240);
  // Draw album name of current song
  text(meta.album(), width/2, 260);
  // Calculate current time in seconds
  float curTime = ((float) song.position())/1000;
  // Calculate length of current song in seconds
  float curLength = ((float) song.length())/1000;
  // Draw current time in song
  text(curTime+ " s/" + curLength + " s", width/2, 280);
  // Draw action (pause or play)
  text(action, width/2, 300);
}

// Key press listener
void keyPressed(){
  if (key == ' '){ // On space pause
    // Switch play tracker
    play = (play) ? false : true;
    if (play){ // Set action to play
      action = ">";
      song.play();
    } else { // Set action to pause
      action = "||";
      song.pause();
    }
  } else if (keyCode == RIGHT){ // Skip to next song
    // Increment index of current song
    curSong++;
    // If current song index greater than length of list of files, set current song index to last song
    if (curSong > filesList.length - 1){
      curSong = filesList.length - 1;
    }
    // Pause currently playing song, effectively stopping it
    song.pause();
    // Load current song
    loadSong();
  } else if (keyCode == LEFT){
    // Decrement index of current song
    curSong--;
    // If current song index less than 0, set current song index to first song
    if (curSong < 0){
      curSong = 0;
    }
    // Pause currently playing song, effectively stopping it
    song.pause();
    // Load current song
    loadSong();
  } else if (key == 's'){
    save(nf(frameCount, 5) + ".png");
  }
}

// Load song
void loadSong(){
  // Load song from current song index
  song = minim.loadFile(filesList[curSong].getAbsolutePath());
  // Play song
  song.play();
  // Load metadata
  meta = song.getMetaData();
}