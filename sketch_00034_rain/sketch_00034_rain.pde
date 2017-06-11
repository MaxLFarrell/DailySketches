///-----------------------------------------------------------------
///   Name:           sketch_00034_rain
///   Description:    Draw and animate rain drop
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

// Renderer
WB_Render render;

// Frame tracker
int f = -16;

// Actual frame tracker
int af = 0;

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

// Draw raindrop
void drawDrop(int x, int y){
  translate(0, 0, 0);
  // Translate x position based on frame
  translate(x, y, 0);
  rotateX(PI/2);
  // Instantiate cone object
  HEC_Cone top = new HEC_Cone();
  // Set top height to 200px
  top.setHeight(200);
  // Set top facets to 50
  top.setFacets(50);
  // Draw inner cylinder
  render.drawFaces(new HE_Mesh(top));
  // Move bottom down 40 px
  translate(0, 0, -40);
  // Instantiate sphere object
  HEC_Geodesic bottom = new HEC_Geodesic();
  // Set radius to 105
  bottom.setRadius(105);
  // Draw bottom
  render.drawFaces(new HE_Mesh(bottom));
}

// Draw the scene
void draw(){
  // Turn off stroke
  noStroke();
  // Turn fill blue
  fill(0, 0, 255, 100);
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Draw rain drop based on frame
  drawDrop(width/2, f*10);
  // Turn on lights
  lights();
  // Increment frame
  f++;
  af++;
  if (af > 96){
    exit();
  }
  // Save frame
  save("frame_" + nf(af, 5) + ".jpg");
}