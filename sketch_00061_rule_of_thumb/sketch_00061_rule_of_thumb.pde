///-----------------------------------------------------------------
///   Name:           sketch_00061_rule_of_thumb
///   Description:    Draw an animate a primitive hand
///   Author:         Max Farrell (max@mail.arcane.inf*3o)
///   Date:           July 7th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import extrusion library
import extruder.*;

// Image for watermark texture
PImage watermark;

// Frame tracker 
int f = 0;

// Rotatation offset
int r = 0;

// Finger object
PShape[] finger;

// Palm object
PShape[] palm;

// Extruder object
extruder e;

// Scale
int scale = 200;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Instantiate extruder object
  e = new extruder(this);
  // Create finger
  finger = e.extrude(createShape(RECT, 0, 0, scale/5, scale), scale/5, "box");
  // Create palm
  palm = e.extrude(createShape(RECT, -scale/2, -scale, scale, scale), scale/5, "box");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set origin to center of image
  translate(width/2, height/2 + scale);
  // Draw palm
  for (PShape poly:palm){
    shape(poly);
  }
  // Draw thumb
  translate(scale*0.6, -(scale*0.75));
  rotateZ(-PI/2);
  // Rotate thumb based on rotation offset
  rotateX(-(PI/2 - radians(r*3)));
  for (PShape poly:finger){
    shape(poly);
  }
  rotateX((PI/2 - radians(r*3)));
  rotateZ(PI/2);
  translate(-scale*0.6, (scale*0.75));
  // Rotate fingers based on rotation offset
  rotateX(PI/2 - radians(r*3));
  // Draw fingers
  translate(-scale/2, -(scale*2.1));
  for (PShape poly:finger){
    shape(poly);
  }
  translate(scale/4, 0);
  for (PShape poly:finger){
    shape(poly);
  }
  translate(scale/4, 0);
  for (PShape poly:finger){
    shape(poly);
  }
  translate(scale/4, 0);
  for (PShape poly:finger){
    shape(poly);
  }
  // Increment frame counter
  f++;
  // Calculate rotation offset
  if (f < 30){ // Rotate up
    r++;
  } else if ((f >= 40)&& (f <= 70)){ // Rotate down
    r--;
  }
  if (f > 70){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}