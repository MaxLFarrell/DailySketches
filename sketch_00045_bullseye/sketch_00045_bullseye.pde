///-----------------------------------------------------------------
///   Name:           sketch_00045_bullseye
///   Description:    Animate an arrow hitting a bullseye
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 21th, 2017
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
  noStroke();
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  
  // Set fill to white
  fill(255);
  // Draw outer bullseye ring
  ellipse(0, -100, 300, 300);
  // Set fill to black
  fill(0);
  // Draw middle bullseye ring
  ellipse(0, -100, 200, 200);
  // Set fill to white
  fill(255);
  // Draw inner bullseye ring
  ellipse(0, -100, 100, 100);
  
  // Go hog wild when it hits the bullseye
  if ((f >= 44) && (f < 88)){
    translate(0, -100);
    rotateX(radians(f*10));
    rotateY(radians(f*10));
    rotateZ(radians(f*10));
  } else if (f >= 88){ // Return to sender
    translate(0, (-188 + f) + f*3);
    rotateZ(PI);
    rotateX(PI/4);
  }else { // Head to bullseye
    translate(0, 400-(f*10));
  }
  
  // Draw arrow
  stroke(255);
  fill(0);
  beginShape();
  vertex(0, 0);
  vertex(-50, 50);
  vertex(-5, 25);
  vertex(-5, 200);
  vertex(5, 200);
  vertex(5, 25);
  vertex(50, 50);
  vertex(0, 0);
  endShape();
  
  // Increment frame
  f++;
  if (f > 162){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}