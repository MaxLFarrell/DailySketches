///-----------------------------------------------------------------
///   Name:           sketch_00031_clock
///   Description:    Draw a clock with time dependent on real time
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 6th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 1;

// Image for watermark texture
PImage watermark;


// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Set background to black
  background(0);
  // Load watermark image
  watermark = loadImage("../watermark.png");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set fill to black
  fill(0);
  // Set stroke to white 
  stroke(255);
  // Draw clock face
  ellipse(width/2, height/2, 600, 600);
  // Set fill to white
  fill(255);
  // Draw seconds hand
  pushMatrix();
  // Set center to center of image
  translate(width/2, height/2);
  // Rotate based on the second
  rotate(radians(second()*6) - (PI/2));
  // Draw thin long hand
  rect(0, 0, 290, 5);
  popMatrix();
  // Draw minutes hand
  pushMatrix();
  // Set center to center of image
  translate(width/2, height/2);
  // Rotate based on the minute
  rotate(radians(minute()*6) - (PI/2));
  // Draw medium length and thickness hand
  rect(0, 0, 145, 10);
  popMatrix();
  // Draw hours hand
  pushMatrix();
  // Set center to center of image
  translate(width/2, height/2);
  // Roate based on the hour
  rotate(radians(hour()*15) + (PI/2));
  // Set fill to red
  fill(255, 0, 0);
  // Set stroke to red
  stroke(255, 0, 0);
  // Draw short thick hand
  rect(0, 0, 72, 15);
  popMatrix();
  // Turn on lights
  lights();
  // Increment frame
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 120){
    exit();
  }
}