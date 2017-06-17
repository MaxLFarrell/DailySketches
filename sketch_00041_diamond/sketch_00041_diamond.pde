///-----------------------------------------------------------------
///   Name:           sketch_00041_diamond
///   Description:    Draw diamond and uhhh, whoops
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 17th, 2017
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
  // Turn off fill
  noFill();
  // Set stroke to white
  stroke(255);
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  if (f < 50){
    // Set center to center of image
    translate(width/2, height/2 - 100, 0);
    // Rotate diamond to be easily viewable
    rotateX(3*(PI/2));
    // Rotate based on frame and incrementally increase speed
    rotateZ(radians(f*3)*f);
  } else {
    // Set offset of diamond x and y
    int toffset = (50 - f) * 10;
    // Move diamond based on frame
    translate(width/2 + toffset, height/2 + toffset , 0);
    // Rotate diamond to be initially easily viewable
    rotateX(3*(PI/2));
    // Rotate extremely fast on z and y axes
    rotateZ(radians(f*10));
    rotateY(radians(f*10));
  }
  // Draw top of diamond as two connected octagons with bottom being slightly larger than top
  extrude(genPlane(8, 100), genPlane(8, 150), 100, "box");
  // Create bottom of diamond with triangle sides, top being the bottom of the following object
  PShape t = genPlane(8, 150);
  int[][] to = new int[10][2];
  to[0] = new int[]{0, 0};
  for (int i = 0; i < t.getVertexCount(); i++) {
    PVector v = t.getVertex(i);
    to[i + 1] = new int[]{(int) v.x, (int) v.y};
  }
  extrude(to, new int[0][0], 300, 100, "triangle");
  // Increment frame
  f++;
  if (f > 115){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".jpg");
}