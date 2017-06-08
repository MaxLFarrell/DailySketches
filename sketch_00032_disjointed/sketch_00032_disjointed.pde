///-----------------------------------------------------------------
///   Name:           sketch_00032_disjointed
///   Description:    Rotating disjointed panels
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 29th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Drag array
int[][] dragArr;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set background to black
  background(0);
  // Set stroke to off-white
  stroke(210);
  // Initialize drag array
  dragArr = new int[16][16];
  // Add drag between 10px and 50px
  for (int y=0;y<16;y++){
    for (int x=0;x<16;x++){
      dragArr[x][y] = (int) random(10, 50);
    }
  }
}

// Draw all rectangles
void drawRects(){
  // For each 50x50px area draw a square and rotate based on frame and rotate based on pregenerated drag
  for (int y=0;y<16;y++){
    for (int x=0;x<16;x++){
      pushMatrix();
      translate(x*50, y*50, 0);
      rotateX(radians((f*6) - dragArr[x][y]));
      rect(0, -25, 50, 50);
      popMatrix();
    }
  }
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Make fill white
  fill(255);
  // Draw all panels
  drawRects();
  // Turn on lights
  lights();
  // Increment frame
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 30){
    exit();
  }
}