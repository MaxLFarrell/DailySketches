///-----------------------------------------------------------------
///   Name:           sketch_00025_a_stretch
///   Description:    Draw stretched building
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 10th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Sound library
import processing.sound.*;

// Soundfile of stretching
SoundFile file;

// Building image texture
PImage bImage;

// Frame tracker
int f;

// Set up scene
void setup() {
  // Set size of flag to 1920px by 1080px and turn on 3d processing
  size(800, 800, P3D);
  // Make stroke light grey
  stroke(100);
  // Set stroke to thin
  strokeWeight(1);
  // Set background to black
  background(0);
  // Set fill to white
  fill(255);
  // Set texture to repeat
  textureWrap(REPEAT);
  // Loading building texture
  bImage = loadImage("http://texturelib.com/Textures/buildings/buildings/buildings_buildings_0011_01_preview.jpg");
  // Load soundfile
  file = new SoundFile(this, "stretch.mp3");
}

// Draw the scene
void draw() {
  // Set sound file to start playing at 1.2 second mark
  if (f == 0){
    file.cue(1.2);
    file.play();
  }
  // Set up 3d camera
  translate(width/2, height/2, 0);
  rotateX(PI/2);
  rotateZ(-PI/6);
  // Create stretched building based on frame
  PShape tmp = createShape(BOX, 100, 50, f * 2.5);
  // Set texture to building texture
  tmp.setTexture(bImage);
  // Draw building
  shape(tmp);
  // Turn on lights (i'm going to be honest I don't think this does anything for us here)
  lights();
  // Increment frame
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".png");
  if (f > 320){
    exit();
  }
}