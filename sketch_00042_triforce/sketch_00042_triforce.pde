///-----------------------------------------------------------------
///   Name:           sketch_00042_triforce
///   Description:    Draw tri-force and animate rotation
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 18th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import extruder library
import extruder.*;

// Extruder
extruder e;

// Frame tracker
int f = 0;

// Points tracker
int[][] points;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set background to black
  background(0);
  e = new extruder(this);
}

// Draw the scene
void draw(){
  // Set fill to goldenrod
  fill(218,165,32);
  // Turn stroke off
  noStroke();
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Rotate 30 degrees clockwise, this sets the triangles up in proper position
  rotate(radians(30));
  // Set position of first triangle
  translate(-50, -100, 0);
  // Rotate based on radians
  rotateY(radians(f*3));
  // Generate triangle with 25 px depth
  PShape[] t = e.extrude(e.genPlane(3, 100), 25, "box");
  // Draw triangle 1
  for (PShape p:t){
    shape(p);
  }
  // Set position of second triangle
  translate(0, 200, 0);
  // Rotate based on radians
  rotateY(radians(f*3));
  // Draw triangle 2
  for (PShape p:t){
    shape(p);
  }
  // Set position of third triangle
  translate(170, -95, 0);
  // Rotate based on radians
  rotateX(radians(f*3));
  // Draw triangle 3
  for (PShape p:t){
    shape(p);
  }
  // Increment frame
  f++;
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".jpg");
}