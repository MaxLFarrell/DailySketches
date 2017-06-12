///-----------------------------------------------------------------
///   Name:           sketch_00036_3d_heart
///   Description:    Draw and rotate a 3d heart
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 12th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

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
  // Set fill to green
  fill(0, 255, 0);
  // Set center of drawing to center of image and slightly up
  translate(width/2, height/5, 0);
  // Scale coordinates to 3/4 original size
  scale(0.75);
  // Rotate heart around y axis by frame
  rotateY(radians(f*3));
  // Start heart shape
  // Each line (besides the last) needs 5 vertexes in order to make a proper plane
  beginShape();
  
  vertex(348, 284, 0);
  vertex(348, 284, 25);
  vertex(276, 176, 25);
  vertex(276, 176, 0);
  vertex(348, 284, 0);
  
  vertex(276, 176, 0);
  vertex(276, 176, 25);
  vertex(184, 260, 25);
  vertex(184, 260, 0);
  vertex(276, 176, 0);
  
  vertex(184, 260, 0);
  vertex(184, 260, 25);
  vertex(184, 384, 25);
  vertex(184, 384, 0);
  vertex(184, 260, 0);
  
  vertex(184, 384, 0);
  vertex(184, 384, 25);
  vertex(348, 570, 25);
  vertex(348, 570, 0);
  vertex(184, 384, 0);
  
  vertex(348, 570, 0);
  vertex(348, 570, 25);
  vertex(512, 384, 25);
  vertex(512, 384, 0);
  vertex(348, 570, 0);
  
  vertex(512, 384, 0);
  vertex(512, 384, 25);
  vertex(512, 260, 25);
  vertex(512, 260, 0);
  vertex(512, 384, 0);
  
  vertex(512, 260, 0);
  vertex(512, 260, 25);
  vertex(420, 176, 25);
  vertex(420, 176, 0);
  vertex(512, 260, 0);
  
  vertex(420, 176, 0);
  vertex(420, 176, 25);
  vertex(348, 284, 25);
  vertex(348, 284, 0);
  vertex(420, 176, 0);
  
  vertex(348, 284, 0);
  vertex(348, 284, 25);
  
  endShape(CLOSE);
  // Increment frame
  f++;
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".jpg");
}