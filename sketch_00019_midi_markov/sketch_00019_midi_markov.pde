///-----------------------------------------------------------------
///   Name:           sketch_00019_midi_markov
///   Description:    Generate an unheard piece from input midis with markov chains
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 26th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import soundcipher library for writing midi
import arb.soundcipher.*;

// File utilities for directory listing
import java.io.File;

// Markov chain utilities
import rita.*;

// Markov chain object
RiMarkov markov;

// Midi object
MidiLoader m;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800);
  // Set text size to 20
  textSize(20);
  // Turn off fill
  noFill();
  // Set background to black
  background(0);
  // Set stroke to white
  stroke(255);
  // Instantiate new markov object
  markov = new RiMarkov(4);
}

// Draw the scene
void draw(){
  // Convert all midis in the data folder to txt representatives using MIDI_Loader
  batchMidi();
  // Load all text representations of the midis into the markov object
  File folder = new File(sketchPath() + "/txt");
  for (String f:folder.list()){
    markov.loadText(loadStrings("txt/" + f)[0]);
  }
  // Draw black background
  background(0);
  // Create score to store midi notes
  SCScore score = new SCScore();
  // Instantiate time tracker
  int time = 0;
  // Generate 4000 notes
  for (int it=0;it<4000;it++){
    // Generate note
    String[] tmpNote = markov.generateTokens(6);
    // Don't add note if it's a B6 (this needs to be fixed)
    if ((double) 182 != Double.parseDouble(tmpNote[4])){
      score.addNote(time, Double.parseDouble(tmpNote[4]), Double.parseDouble(tmpNote[3]), Double.parseDouble(tmpNote[1])/1000);
      // Increment time tracker
      time += Double.parseDouble(tmpNote[1])/1000;
    }
  }
  // Save midi file to current location
  score.writeMidiFile(sketchPath("") + "/out.mid");
  // Exit program
  exit();
}

// Midi to txt conversion for all files in data folder
void batchMidi(){
  // Create new folder object for listing
  File folder = new File(dataPath(""));
  // For each midi file convert the midi file to text file in the txt directory
  for (String f:folder.list()){
    MidiLoader tmpM = new MidiLoader(f);
    tmpM.toTxt();
  }
}