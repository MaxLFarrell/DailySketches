///-----------------------------------------------------------------
///   Name:           sketch_00048_roomy
///   Description:    Draw and rotate a small room
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 24th, 2017
///   Notes:          Textures from:
///                   Wall: http://1.bp.blogspot.com/-kfcQiDO6O-k/UBD1maj-WdI/AAAAAAAAB5Q/_5dCnZ29spM/s1600/Seamless+wall+white+paint+plaster+stucco+texture+02.jpg
///                   Carpet: https://www.textures.com/system/gallery/photos/Fabric/Carpet/107911/Carpet0012_1_270.jpg
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

import java.util.List;

import extruder.*;

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Extruder object
extruder e;

// List of pshape of icosahedron
List<PShape> iso;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Turn off stroke
  noStroke();
  // Set fill to black
  fill(0, 255, 0);
  // Instantiate extruder
  e = new extruder(this);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Generate icosahedron
  iso = icosa(new Icosahedron(1), 100);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Rotate 65 degrees on the x axis to get a better view
  rotateX(radians(65));
  // Rotate 5.1... degrees per frame (the decimal places are to ensure it 360 degrees in 70 frames)
  rotateZ(radians(f*5.14285714286));
  
  // Draw icosahedron
  for (PShape i:iso){
    shape(i);
  }
  // Increment frame
  f++;
  /*
  if (f > 70){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
  */
}