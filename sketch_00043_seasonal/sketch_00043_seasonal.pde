///-----------------------------------------------------------------
///   Name:           sketch_00043_seasons
///   Description:    Represent seasonal change simply
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 19th, 2017
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

// Color offset
int c = 43;

// Color operation tracker
boolean csub = true;

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
  rotateY(radians(f*3));
  // Change fill based on color offset
  fill(218, c * 6, 31);
  // Draw right side of leaf
  bezier(0, -200, 0, 200, 0, -25, 200, 0, -25, 0, 200, 0);
  // Draw left side of leaf
  bezier(0, -200, 0, -200, 0, 25, -200, 0, 25, 0, 200, 0);
  // Draw stem of leaf
  line(0, 200, 0, 250);
  // Increment frame
  f++;
  if (csub){
    c--;
  } else {
    c++;
  }
  if (c > 43){
    csub = true;
  } else if (c < 11){
    csub = false;
  }
  if (f > 60){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}