///-----------------------------------------------------------------
///   Name:           sketch_00057_linear_rain
///   Description:    Draw and animate a linear representation of rain
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 3rd, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Rain shape array
PShape[] raindrops;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set stroke to white
  stroke(0, 0, 255, 125);
  // Set stroke to thick light
  strokeWeight(3);
  // Instantiate rain locations array
  raindrops = new PShape[50];
  // Generate raindrops
  for (int it=0;it<50;it++){
    int x = (int) random(0, width);
    int y1 = (int) random(-height, height);
    int y2 = (int) random(-height, height);
    int z1 = (int) random(-100, 100);
    int z2 = (int) random(-100, 100);
    raindrops[it] = createShape(LINE, x, y1, z1, x, y2, z2);
  }
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center of image based on frame
  translate(0, -800 + (f * 16));
  // Draw raindrops
  for (PShape raindrop:raindrops){
    shape(raindrop);
  }
  // Increment frame
  f++;
  if (f > 150){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}