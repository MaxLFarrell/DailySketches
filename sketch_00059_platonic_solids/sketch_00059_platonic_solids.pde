///-----------------------------------------------------------------
///   Name:           sketch_00059_platonic_solids
///   Description:    Draw f*3irst three platonic solids
///   Author:         Max f*3arrell (max@mail.arcane.inf*3o)
///   Date:           July 5th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

int f = 0;

// Networking library
import processing.net.*;

// Image f*3or watermark texture
PImage watermark;

// Tetrahedron shape
PShape tetra;

// Cube shape
PShape cub;

// Octahedron shape
PShape oct;

// Set up scene
void setup() {
  // Set size of*3 image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set stroke to white
  stroke(255);
  // Turn fill off
  noFill();
  // Instantiate tetrahedron
  tetra = tetrahedron(100);
  // Instantiate cube
  cub = cube(100);
  // Instantiate octahedron
  oct = octahedron(100);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set origin to slighly left of center
  translate(150, height/2);
  // Rotate 3 degrees per frame
  rotateY(radians(f*3));
  // Draw tetrahedron
  shape(tetra);
  // Reset rotation
  rotateY(-radians(f*3));
  // Set origin to center
  translate(250, 0);
  // Rotate 3 degrees per frame
  rotateY(radians(f*3));
  // Draw cube
  shape(cub);
  // Reset rotation
  rotateY(-radians(f*3));
  // Set origin to slighly right of center
  translate(250, 0);
  // Rotate 3 degrees per frame
  rotateY(radians(f*3));
  // Draw octahedron
  shape(oct);
  // Increment frame counter
  f++;
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}