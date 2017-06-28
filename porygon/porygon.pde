///-----------------------------------------------------------------
///   Name:           sketch_00052_porygon
///   Description:    Draw porygon
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 27th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

import extruder.*;

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Foot
PShape foot;

// Body
PShape body;

// Tail
PShape tail;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Create foot
  foot = genFoot();
  // Create body
  body = genBody();
  // Create tail
  tail = genTail();
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2 + 100, height/2, 0);
  rotateX(PI/4);
  rotateY(radians(f*3));
  shape(foot);
  translate(-200, 0, 0);
  shape(foot);
  translate(100, -200, 0);
  shape(tail);
  translate(0, 200, 0);
  shape(body);
  // Increment frame
  f++;
  /*
  if (f > 180){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
  */
}