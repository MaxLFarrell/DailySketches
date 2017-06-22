///-----------------------------------------------------------------
///   Name:           sketch_00046_the_guide
///   Description:    Animate an arrow hitting a bullseye
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 21th, 2017
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

// PShape list for covers
PShape[] covers;

// PShape for extruding cover
PShape cover;

// Screen overlay pshape
PShape screen;

// Image for screen
PImage screenImage;

// Operation tracker for opacity offset
boolean osub = false;

// Opacity offset
int ooffset = 0;

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
  screenImage = loadImage("dontpanic.png");
  // Instantiate extruder object
  e = new extruder(this);
  // Create cover object to be extruded
  cover = createShape(RECT, -100, -100, 200, 200);
  // Extrude covers
  covers = e.extrude(cover, 10, "box");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Roate 45 degrees on the x axis to get a better view
  rotateX(radians(45));
  
  // Open the book
  if (f < 35){
    translate(f*3, 0, 0);
    for (PShape s:covers){
      shape(s);
    }
  
    translate(-(f*6), 0, 0);
    for (PShape s:covers){
      shape(s);
    }
  } else if ((f >= 35) && (f < 65)){ // Boot up
    translate(100, 0, 0);
    for (PShape s:covers){
      shape(s);
    }
  
    translate(-200, 0, 0);
    for (PShape s:covers){
      shape(s);
    }
  } else if ((f >= 65) && (f < 125)){ // Warm up
    if (osub){
      ooffset = 250 - ((f - 100) * 10); 
    } else {
      ooffset = 10 * (f - 65); 
    }
    if (ooffset > 250){
      osub = true;
    } 
    
    translate(0, 0, 12);
  
    screen = createShape();
    screen.beginShape();
    screen.tint(255, ooffset);
    screen.texture(screenImage);
    screen.vertex(-190, -90, 0, 0);
    screen.vertex(-190, 90, 0, 180);
    screen.vertex(190, 90, 380, 180);
    screen.vertex(190, -90, 380, 0);
    screen.endShape();
  
    shape(screen);
  
    translate(0, 0, -1);
    fill(0);
    shape(createShape(RECT, -200, -100, 400, 200));
  
    translate(100, 0, -11);
    for (PShape s:covers){
      shape(s);
    }
  
    translate(-200, 0, 0);
    for (PShape s:covers){
      shape(s);
    }
  } else if (f >= 125){
    translate(100 - ((f - 125)*3), 0, 0);
    for (PShape s:covers){
      shape(s);
    }
  
    translate(-200 + ((f - 125)*6), 0, 0);
    for (PShape s:covers){
      shape(s);
    }
  }
  
  // Increment frame
  f++;
  if (f > 160){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}