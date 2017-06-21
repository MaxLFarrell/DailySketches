///-----------------------------------------------------------------
///   Name:           sketch_00044_image2pshape
///   Description:    Convert image to pshape
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 19th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Points tracker
int[][] points;

// Image for watermark texture
PImage watermark;

PShape loaded;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set background to black
  background(0);
  loaded = image2pshape("test.png", 0);
}

// Draw the scene
void draw(){
  // Draw black background
  background(255);
  // Set stroke to white
  stroke(255);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  rotateY(radians(f*3));
  shape(loaded);
  f++;
  /*
  if (f > 60){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
  */
}