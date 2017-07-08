///-----------------------------------------------------------------
///   Name:           sketch_00062_text
///   Description:    Draw all text in a txt file, text files from Project Gutenberg
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 8th, 2017
///   Notes:          Text files from Project Gutenberg
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// Loaded text
String mText = "";

// Name of text file to load
String txtFile = "huckleberry_finn";

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Load text
  mText = join(loadStrings(txtFile + ".txt"), " ");
  // Calculate text size
  textSize((width*height)/mText.length());
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set origin to slighly left of center
  fill(0, 255, 0);
  // Draw text
  text(mText, 0, 0, width, height);
  // Save frame to image
  save(txtFile + ".png");
  // Exit program
  exit();
}