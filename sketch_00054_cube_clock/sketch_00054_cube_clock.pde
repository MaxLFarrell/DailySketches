///-----------------------------------------------------------------
///   Name:           sketch_00054_cube_clock
///   Description:    Cube clock
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 30th, 2017
///   Notes:          horse
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set stroke to white
  stroke(255);
  // Turn off fill
  noFill();
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  
  // Set center to 200 px above center and draw hours cube
  translate(width/2, height/2 - 200, 0);
  rotate(radians(hour()*30));
  box(100);
  rotate(-(radians(hour()*30)));
  
  // Set center to center and draw minutes cube
  translate(0, 200, 0);
  rotate(radians(minute()*6));
  box(100);
  rotate(-(radians(minute()*6)));
  
  // Set center to 200px below center and draw seconds cube
  translate(0, 200, 0);
  rotate(radians(second()*6));
  box(100);
  rotate(-(radians(minute()*6)));
}