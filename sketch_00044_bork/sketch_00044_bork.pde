///-----------------------------------------------------------------
///   Name:           sketch_00044_bork
///   Description:    2 frame animation test
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 19th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Bork tracker
boolean bork = false;

// Points tracker
int[][] points;

// Image for watermark texture
PImage watermark;

// Frame 1
PImage frame1;

// Frame 2
PImage frame2;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set background to black
  background(0);
  // Load frame 1
  frame1 = loadImage("frame1.png");
  // Load frame 2
  frame2 = loadImage("frame2.png");
}

// Draw the scene
void draw(){
  // Set stroke to white
  stroke(255);
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set origin to center of image
  translate(width/2, height/2, 0);
  // Rotate 3 degrees per frame
  rotateY(radians(f*3));
  // If bork is true draw the second frame, otherwise draw the first
  if (bork){
    image(frame2, -400, -400);
  } else {
    image(frame1, -400, -400);
  }
  // Increment frame
  f++;
  // Every 30 frames change bork from true to false or vice versa
  if ((f % 30) == 0){
    bork = (bork) ? false : true;
  }
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}