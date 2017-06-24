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

import extruder.*;

int size = 150;

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Room texture
PImage roomim;

// Floor shape
PShape floor;

// Wall 1 shape
PShape wall1;

// Wall 2 shape
PShape wall2;

// Extruder object
extruder e;

// List of pshape of icosahedron
List<PShape> iso;

// Subdivisions of icosahedron
static int ICOSUBDIVISION = 2;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Turn off stroke
  noStroke();
  // Set fill to black
  fill(0);
  // Instantiate extruder
  e = new extruder(this);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Load room texture
  roomim = loadImage("room.jpg");
  // Generate icosahedron
  iso = isoca(new Icosahedron(), 100);
  // Create floor shape
  floor = createShape();
  floor.beginShape();
  floor.texture(roomim);
  floor.vertex(-size, -size, 0, 0, 0);
  floor.vertex(size, -size, 0, 270, 0);
  floor.vertex(size, size, 0, 270, 270);
  floor.vertex(-size, size, 0, 0, 270);
  floor.vertex(-size, -size, 0, 0, 0);
  floor.endShape();
  // Create wall 1 shape
  wall1 = createShape();
  wall1.beginShape();
  wall1.texture(roomim);
  wall1.vertex(-size, -size, 0, 0, 270);
  wall1.vertex(size, -size, 0, 270, 270);
  wall1.vertex(size, -size, size*2, 270, 540);
  wall1.vertex(-size, -size, size*2, 0, 540);
  wall1.vertex(-size, -size, 0, 0, 270);
  wall1.endShape();
  // Create wall 2 shape
  wall2 = createShape();
  wall2.beginShape();
  wall2.texture(roomim);
  wall2.vertex(size, -size, 0, 0, 270);
  wall2.vertex(size, -size, size*2, 0, 540);
  wall2.vertex(size, size, size*2, 270, 540);
  wall2.vertex(size, size, 0, 270, 270);
  wall2.vertex(size, -size, 0, 0, 270);
  wall2.endShape();
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
  
  // Draw point light in room
  pointLight(255, 255, 255, 0, 150, 100);
  
  // Draw floor
  shape(floor);
  
  // Draw wall 1
  shape(wall1);
  
  // Draw wall 2
  shape(wall2);
  
  // First pull ico through floor, then let it hang, then push it back down
  if (f < 20){
    translate(0, 0, -100 + (f*10));
  } else if ((f >= 20) && (f < 50)){
    translate(0, 0, 100);
  } else if (f >= 50){
    translate(0, 0, 100 - (10 * (f - 50)));
  }
  
  // Draw icosahedron
  for (PShape i:iso){
    shape(i);
  }
  // Increment frame
  f++;
  if (f > 70){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}