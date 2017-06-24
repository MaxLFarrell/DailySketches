///-----------------------------------------------------------------
///   Name:           sketch_00047_nds
///   Description:    Draw and animate a Nontendo Double Screen
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 23rd, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

import extruder.*;

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Extruder object
extruder e;

// Screen overlay pshape
PShape screen;

// Image for screen
PImage screenImage;

// Operation tracker for opacity offset
boolean osub = false;

// Opacity offset
int ooffset = 0;

PShape bottomo;

PShape[] bottom;

PImage bottomim;

PShape topo;

PShape[] top;

PImage topim;

PShape topbaro;

PShape[] topbar;

PShape dpado;

PShape[] dpad;

PShape[] rbutton;

PShape[] srbutton;

PShape lsbuttono;

PShape[] lsbutton;

PShape rsbuttono;

PShape[] rsbutton;

PShape topscreen;

PShape bottomscreen;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Set stroke to white
  stroke(255);
  // Set fill to black
  fill(0);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Load image to overlay on screen
  // screenImage = loadImage("dontpanic.png");
  // Instantiate extruder object
  e = new extruder(this);
  // Create bottom side
  bottomo = createShape(RECT, -200, -100, 400, 200);
  bottom = e.extrude(bottomo, 25, "box");
  // Create dpad
  dpado = createShape();
  dpado.beginShape();
  dpado.vertex(-175, 0);
  dpado.vertex(-175, 25);
  dpado.vertex(-150, 25);
  dpado.vertex(-150, 50);
  dpado.vertex(-125, 50);
  dpado.vertex(-125, 25);
  dpado.vertex(-100, 25);
  dpado.vertex(-100, 0);
  dpado.vertex(-125, 0);
  dpado.vertex(-125, -25);
  dpado.vertex(-150, -25);
  dpado.vertex(-150, 0);
  dpado.endShape();
  dpad = e.extrude(dpado, 10, "box");
  // Create multi use round button
  rbutton = e.extrude(e.genPlane(50, 15), 10, "box");
  // Create small multi use round button
  srbutton = e.extrude(e.genPlane(50, 5), 10, "box");
  // Create left shoulder button
  lsbuttono = createShape(RECT, -200, -100, 50, 25);
  lsbutton = e.extrude(lsbuttono, 30, "box");
  // Create right shoulder button
  rsbuttono = createShape(RECT, 150, -100, 50, 25);
  rsbutton = e.extrude(rsbuttono, 30, "box");
  // Create top side
  topo = createShape(RECT, -200, 30, 400, 170);
  top = e.extrude(topo, 25, "box");
  // Create top bar
  topbaro = createShape(RECT, -150, 0, 300, 30);
  topbar = e.extrude(topbaro, 25, "box");
  // Create top screen
  topim = loadImage("topscreen.png");
  topscreen = createShape();
  topscreen.beginShape();
  topscreen.texture(topim);
  topscreen.vertex(-90, -60, 0, 125);
  topscreen.vertex(-90, 90, 0, 0);
  topscreen.vertex(80, 90, 170, 0);
  topscreen.vertex(80, -60, 170, 125);
  topscreen.endShape();
  // Create bottom screen
  bottomim = loadImage("bottomscreen.png");
  bottomscreen = createShape();
  bottomscreen.beginShape();
  bottomscreen.texture(bottomim);
  bottomscreen.vertex(-90, -70, 0, 0);
  bottomscreen.vertex(80, -70, 170, 0);
  bottomscreen.vertex(80, 90, 170, 160);
  bottomscreen.vertex(-90, 90, 0, 160);
  bottomscreen.endShape();
}

// Draw the scene
void draw(){
  strokeWeight(1);
  fill(0);
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Roate 45 degrees on the x axis to get a better view
  rotateX(radians(45));
  
  translate(0, 0, -25);
  for (PShape poly:bottom){
    shape(poly);
  }
  
  translate(0, 0, 36);
  
  shape(bottomscreen);
  
  translate(0, 0, -1);
  
  for (PShape poly:dpad){
    shape(poly);
  }
  
  translate(125, 0, 0);
  for (PShape poly:rbutton){
    shape(poly);
  }
  translate(25, 25, 0);
  for (PShape poly:rbutton){
    shape(poly);
  }
  translate(-25, 25, 0);
  for (PShape poly:rbutton){
    shape(poly);
  }
  translate(-25, -25, 0);
  for (PShape poly:rbutton){
    shape(poly);
  }
  
  translate(0, 50, 0);
  for (PShape poly:srbutton){
    shape(poly);
  }
  translate(0, 15, 0);
  for (PShape poly:srbutton){
    shape(poly);
  }
  
  //translate(0, -100, 125);
  translate(-100, -115, -10);
  
  for (PShape poly:lsbutton){
    shape(poly);
  }
  
  for (PShape poly:rsbutton){
    shape(poly);
  }
  
  translate(0, -75, 0);
  
  if (f < 45){
    rotateX(radians(f*2));
  } else if ((f >= 45) && (f < 80)){
    rotateX(radians(90));
  } else {
    rotateX(radians(90 - (2 *(f - 80)))); 
  }
  
  for (PShape poly:top){
    shape(poly);
  }
  
  for (PShape poly:topbar){
    shape(poly);
  }
  
  translate(0, 100, 0);

  translate(0, 0, -1);
  shape(topscreen);
  translate(0, 0, 1);
   
  strokeWeight(5);
  noFill();
  translate(0, 0, 25);
  rect(-18, -35, 35, 35);
  rect(-18, 35, 35, 35);
  
  // Increment frame
  f++;
  if (f > 125){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}