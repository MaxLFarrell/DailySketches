///-----------------------------------------------------------------
///   Name:           sketch_00038_random_extrusion
///   Description:    Create a random plane then extrude and draw it
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 14th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

import extruder.*;

extruder e;

// Frame tracker
int f = 0;

// Points tracker
ArrayList<int[]> points;

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
  // Instantiate extruder
  e = new extruder(this);
  // Instantiate points tracker
  points = new ArrayList<int[]>();
  // Fill points tracker with random points
  for (int it=0;it<100;it++){
    points.add(new int[]{(int) random(-width/2, width/2), (int) random(-height/2, height/2)});
  }
}

// Draw the scene
void draw(){
  fill(0, 255, 0);
  // Set stroke to white
  stroke(255);
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  translate(width/2, height/2, 0);
  // Rotate based on frame
  rotateY(radians(f*3));
  // Initialize pshape for mutated extrusion
  PShape mut = createShape();
  // Start shape
  mut.beginShape();
  // Set all vertices from points tracker
  for (int it= 0;it < points.size();it++){
    mut.vertex(points.get(it)[0], points.get(it)[1]);
  }
  // End shape
  mut.endShape();
  // Draw mutated extrusion
  shape(e.extrude(mut, 100, "box"));
  // Increment frame
  f++;
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".jpg");
}