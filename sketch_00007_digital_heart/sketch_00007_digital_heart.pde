///-----------------------------------------------------------------
///   Name:           sketch_00007_digital_heart
///   Description:    Digital heart ui example
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 14th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Set up scene
void setup() {
  // Set size of the frame to 800px by 800px
  size(800, 800);
  // Turn off stroke
  noStroke();
  // Set background to black
  background(0);
  // Set fill to green
  fill(0, 255, 0);
}

// Draw the scene
void draw() {
  fill(0, 255, 0);
  textAlign(3,3);
  textSize(400);
  text("♥", width/2, height/2);
  fill(0);
  textSize(300);
  text("♥", width/2, height/2);
  save("example.jpg");
}