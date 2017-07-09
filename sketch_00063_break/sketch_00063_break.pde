///-----------------------------------------------------------------
///   Name:           sketch_00063_break
///   Description:    Subdivide block, then show subdivisions at a given interval
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 9th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// X and Y of block
int scale = 400;

// Number of divisions per row and column
int divisions = 8;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  fill(0);
  if (f < 30){ // Ramp up color
    stroke(0, f*(255/30), 0);
  } else if (f >= 30){ // Ramp down color
    stroke(0, 255 - (f-30)*(255/30), 0);
  }
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Start drawing at a point that makes the center of the block the center of the image
  translate(width/2 - (scale/2), height/2 - (scale/2));
  // Draw subdivisions
  for (int column=0;column<divisions;column++){
    for (int row=0;row<divisions;row++){
      box(scale/divisions);
      translate(scale/divisions, 0);
    }
    translate(-scale, scale/divisions);
  }
  // Increment frame counter
  f++;
  if (f > 60){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}