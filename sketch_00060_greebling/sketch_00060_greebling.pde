///-----------------------------------------------------------------
///   Name:           sketch_00060_greebling
///   Description:    Greebling a given plane
///   Author:         Max Farrell (max@mail.arcane.inf*3o)
///   Date:           July 6th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------


// Image for watermark texture
PImage watermark;

// Greebled plane
PShape[] greeblePlane;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Create plane to greeble along
  PShape plane = createShape();
  plane.beginShape();
  plane.vertex(-200, -200);
  plane.vertex(200, -200);
  plane.vertex(200, 200);
  plane.vertex(-200, 200);
  plane.vertex(-200, -200);
  plane.endShape();
  // Generate greebled plane
  greeblePlane = greeble(plane, 100);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set origin to center of image
  translate(width/2, height/2);
  // Draw plane
  shape(createShape(RECT, -200, -200, 400, 400));
  // Draw greebles
  for (PShape greeble:greeblePlane){
    shape(greeble);
  }
  // Save frame
  save(nf((int) random(9999), 5) + ".png");
  // Exit program
  exit();
}