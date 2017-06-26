///-----------------------------------------------------------------
///   Name:           sketch_00050_one_sided_light
///   Description:    Draw a light with one side and rotate
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 26th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import list library
import java.util.List;

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// List of pshapes of light
List<PShape> light;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Turn off stroke
  noStroke();
  // Set fill to black
  fill(0);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set fill to soft yellow
  fill(255, 255, 213);
  // Generate light
  light = icosa(new Icosahedron(1), 200);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Rotate 90 degrees on the x axis
  rotateX(PI/2);
  // Rotate 3 degrees per frame on the z axis
  rotateZ(radians(f*3));
  // Draw point light on light
  pointLight(255, 255, 255, 0, 500, 500);
  // Draw light
  for (PShape poly:light){
    shape(poly);
  }
  // Increment frame
  f++;
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}