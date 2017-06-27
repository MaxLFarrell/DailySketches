///-----------------------------------------------------------------
///   Name:           sketch_00051_containment_2
///   Description:    Re contain the sphere
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

// Extruder object
extruder e;

// Contaiment object
PShape[][] container;

// Rotation offset
int rotationOffset = 0;

// Rotation operation tracker
boolean rotSub = true;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Instantiate extruder object
  e = new extruder(this);
  // Create container object
  // Set stroke to white
  stroke(255);
  // Set fill to black
  fill(0);
  container = new PShape[3][3];
  PShape containerBO = createShape(RECT, -200, -200, 400, 400);
  int[][] points = new int[containerBO.getVertexCount()][2];
  // For each vertex, add the x and y of the vertex to points
  for (int i = 0; i < containerBO.getVertexCount(); i++) {
    PVector v = containerBO.getVertex(i);
    points[i] = new int[]{(int) v.x, (int) v.y};
  }
  container[0] = e.extrude(points, new int[0][0], 0, -300, "box");
  container[1] = e.extrude(createShape(RECT, 0, 0, 400, 10), 100, "box");
  container[2] = e.extrude(createShape(RECT, 0, 0, 10, 200), 200, "box");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  
  shape(container[0][0]);
  shape(container[0][1]);
  
  translate(0, 0, -200);
  noStroke();
  fill(255);
  rotate(radians(f*2));
  directionalLight(0, 125, 0, 100, 100, 0);
  rotate(-radians(f*2));
  sphere(100);
  translate(0, 0, 200);
  stroke(0);

  translate(-200, -200, 10);
  rotateX((-PI/2) + radians(rotationOffset));
  for (PShape poly:container[1]){
    shape(poly);
  }
  rotateX((PI/2) - radians(rotationOffset));
  
  translate(0, 100);
  rotateY((PI/2) - radians(rotationOffset));
  for (PShape poly:container[2]){
    shape(poly);
  }
  rotateY((-PI/2) + radians(rotationOffset));
  
  translate(400, 0, -10);
  rotateY((-PI/2) + radians(rotationOffset));
  for (PShape poly:container[2]){
    shape(poly);
  }
  rotateY((PI/2) - radians(rotationOffset));

  translate(-400, 300);
  rotateX((PI/2) - radians(rotationOffset));
  for (PShape poly:container[1]){
    shape(poly);
  }
  

  // Increment frame
  f++;
  if (f > 180){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
  // Calculate rotation offset
  if (rotSub){
    rotationOffset--;
  } else {
    rotationOffset++;
  }
  if (rotationOffset > 89){
    rotSub = true;
  } else if (rotationOffset < 1){
    rotSub = false;
  }
}