///-----------------------------------------------------------------
///   Name:           sketch_00037_extrusions
///   Description:    Create extrusions
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 13th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Points tracker
int[][] points;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set background to black
  background(0);
}

// Draw the scene
void draw(){
  // Set stroke to white
  stroke(255);
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Rotate based on frame
  rotateY(radians(f*3));
  // Draw an extruded rectangle with 100px depth and box edges
  extrude(
    createShape(RECT, -100, -200, 200, 200),
    100,
    "box"
  );
  // Initialize pshape for pyramid
  PShape pyramid = createShape();
  // Start shape
  pyramid.beginShape();
  // Set center
  pyramid.vertex(0, 100);
  // Set all other vertices
  pyramid.vertex(-100, 0);
  pyramid.vertex(-100, 200);
  pyramid.vertex(100, 200);
  pyramid.vertex(100, 0);
  // End shape
  pyramid.endShape();
  // Draw pyramid with 100 px depth and triangle edges
  extrude(pyramid, 100, "triangle");
  // Increment frame
  f++;
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".jpg");
}