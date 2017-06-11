///-----------------------------------------------------------------
///   Name:           sketch_00035_pacman
///   Description:    Draw and animate pacman
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 11th, 2017
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

// Renderer
WB_Render render;

// Frame tracker
int f = -8;

// Rotation offset tracker
int r = -3;

// Rotation subtraction tracker
boolean rsub = true;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
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
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Translate position of pacman based on frame
  translate(f*10, height - (f * 10), 0);
  // Create bottom sphere
  HEC_Geodesic geodesic = new HEC_Geodesic().setRadius(80);
  // Create mesh from bottom sphere
  HE_Mesh mesh = new HE_Mesh(geodesic);
  // Create plane to cut bottom
  WB_Plane plane = new WB_Plane(0, 0, 0, 20, 20, 0);
  // Create modifier from plane
  HEM_Slice slice = new HEM_Slice().setPlane(plane);
  // Apply modifier to bottom sphere
  mesh.modify(slice);
  // Draw half edges version of bottom
  render.drawHalfedges(mesh, 2);
  // Rotate Z coordinate based on r
  rotateZ(PI + radians(r));
  // Create top sphere
  geodesic = new HEC_Geodesic().setRadius(80);
  // Create mesh from top sphere
  mesh = new HE_Mesh(geodesic);
  // Create plane to cut bottom
  plane = new WB_Plane(0, 0, 0, 20, 20, 0);
  // Create modifier from plane
  slice = new HEM_Slice().setPlane(plane);
  // Apply modifier to top sphere
  mesh.modify(slice);
  // Draw half edges version of top
  render.drawHalfedges(mesh, 2);
  // Turn on lights
  lights();
  // If rotation subtraction true subtract 5 degrees otherwise add 5 degrees
  if (rsub){
    r -= 5;
  } else {
    r += 5;
  }
  // If r is greater than -5 turn subtraction on, if it's less than -90 turn subtraction off
  if (r > -5){
    rsub = true;
  } else if (r < -90){
    rsub = false;
  }
  
  // Increment frame
  f++;
  if ((f+8) > 76){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f+8, 5) + ".jpg");
}