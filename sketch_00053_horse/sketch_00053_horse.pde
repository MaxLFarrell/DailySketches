///-----------------------------------------------------------------
///   Name:           sketch_00053_horse
///   Description:    horse
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 29th, 2017
///   Notes:          horse
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import extruder library
import extruder.*;

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Extruder tool
extruder e;

// Head
PShape[] head;

// Leg 
PShape[] leg;

// Body
PShape[] body;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Instantiate extruder tool
  extruder e = new extruder(this);
  // Create head
  head = e.extrude(createShape(RECT, -50, -50, 100, 100), 100, "box");
  // Create body
  body = e.extrude(createShape(RECT, -150, -75, 300, 150), 150, "box");
  // Create leg
  leg = e.extrude(createShape(RECT, -25, -25, 50, 50), 125, "box");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Lower the horse
  if (f < 40){
    // Set center to center of image
    translate(width/2, -160 + (f*14), 0);
    // Rotate to get easier visibilty
    rotateX(PI/2);
    scale(0.75);
    for (PShape poly:body){
      shape(poly);
    }
    translate(-250, 0);
    for (PShape poly:head){
      shape(poly);
    }
    translate(115, 50, -130);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(265, 0, 0);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(0, -100, 0);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(-265, 0, 0);
    for (PShape poly:leg){
      shape(poly);
    }
  } else if (f < 60){ // Examine the horse
    // Set center to center of image
    translate(width/2, height/2, 0);
    // Rotate to get easier visibilty
    rotateX(PI/2);
    scale(0.75);
    for (PShape poly:body){
      shape(poly);
    }
    translate(-250, 0);
    for (PShape poly:head){
      shape(poly);
    }
    translate(115, 50, -130);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(265, 0, 0);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(0, -100, 0);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(-265, 0, 0);
    for (PShape poly:leg){
      shape(poly);
    }
  } else { // Blow up the horse
    // Set center to center of image
    translate(width/2 + ((f-60)*6), height/2, 0);
    // Rotate to get easier visibilty
    rotateX(PI/2);
    scale(0.75);
    for (PShape poly:body){
      shape(poly);
    }
    translate(-250 - ((f-60)*12), 0);
    for (PShape poly:head){
      shape(poly);
    }
    translate(115 + ((f-60)*6), 50, -130 - ((f-60)*6));
    for (PShape poly:leg){
      shape(poly);
    }
    translate(265, 0, 0);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(0, -100, 0);
    for (PShape poly:leg){
      shape(poly);
    }
    translate(-265, 0, 0);
    for (PShape poly:leg){
      shape(poly);
    }
  }
  // Increment frame
  f++;
  if (f > 156){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}