///-----------------------------------------------------------------
///   Name:           sketch_00033_wheel
///   Description:    Draw and animate rolling wheel
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 29th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import processing.opengl.*;

// Mesh
HE_Mesh mesh;

// Renderer
WB_Render render;

// Frame tracker
int f = 0;

// Roll operation tracker
boolean rsubtract = false;

// Roll offset tracker
int r = 10;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 900px by 900px
  size(600, 600, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set background to black
  background(0);
  // Instantiate renderer
  render = new WB_Render(this);
}

// Draw the scene
void draw(){
  // Make stroke black
  stroke(0);
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Translate x position based on frame
  translate(width - r, height/2, 0);
  // Rotate based on frame
  int rotateAngle = f * 10;
  // If wheel is rolling back make rotation negative
  if (rsubtract){
    rotateAngle = 0 - rotateAngle;
  }
  // Rotate
  rotateZ(rotateAngle);
  // Instantiate cylinder object
  HEC_Cylinder cylinder = new HEC_Cylinder();
  // Set inner cylinder height to 200px
  cylinder.setHeight(200);
  // Set innder cylinder facts to 10
  cylinder.setFacets(10);
  // Create mesh from inner cylinder
  mesh = new HE_Mesh(cylinder);
  // Create lattice modifier
  HEM_Lattice lattice = new HEM_Lattice().setDepth(10).setWidth(10);
  // Modify inner cylinder mesh with lattice modifier
  mesh.modify(lattice);
  // Draw inner cylinder
  render.drawFaces(mesh);
  // Turn off stroke
  noStroke();
  // Instantiate outer cylinder
  cylinder = new HEC_Cylinder();
  // Set outer cylinder height to 175px
  cylinder.setHeight(175);
  // Set outer cylinder facets to 50
  cylinder.setFacets(50);
  // Set radius of outer cylinder to 135px
  cylinder.setRadius(135);
  // Create mesh from outer cylinder
  mesh = new HE_Mesh(cylinder);
  // Draw outer cylinder
  render.drawFaces(mesh);
  // Turn on lights
  lights();
  // Increment frame
  f++;
  // If rsubtract is true subtract 10 from rotation offset, else add 10
  if (rsubtract){
    r -= 10;
  } else {
    r += 10;
  }
  // If rotation offset greater than width set rsubtract to true (start rolling back)
  if (r > width){
    rsubtract = true;
  } else if (r < 0){
    rsubtract = false;
  }
  if (f > 119){
    exit();
  }
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
}