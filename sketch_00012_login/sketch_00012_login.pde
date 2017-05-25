///-----------------------------------------------------------------
///   Name:           sketch_00012_login
///   Description:    UI test for login page
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 19th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame counter
int f = 0;

// Cursor blink tracker
int c = 0;

// Set up scene
void setup() {
  // Set size of flag to 800px by 800px and turn on 3d processing
  size(800, 800, P3D);
  // Make stroke white
  stroke(255);
  // Turn off fill
  noFill();
  // Set stroke to medium
  strokeWeight(5);
  // Set background to black
  background(0);
}

// Draw the scene
void draw() {
  // Redraw background
  background(0);
  // Start outer circle
  pushMatrix();
  // Set center to 100px above center
  translate(width/2, height/2 - 100, 0);
  // Rotate the circle
  rotateY(radians(f*3));
  // Draw the circle
  ellipse(0, 0, 200, 200);
  // End the circle
  popMatrix();
  // Start inner circle
  pushMatrix();
  // Set center to 100px above center
  translate(width/2, height/2 - 100, 0);
  // Rotate the circle
  rotateX(radians(f*3));
  // Draw the circle
  ellipse(0, 0, 100, 100);
  // End the circle
  popMatrix();
  // Set text size to 20
  textSize(20);
  // Align text to center, bottom
  textAlign(CENTER, BOTTOM);
  if (c <= 49){
    // Draw text
    text("> arcane.info login: | ", width/2, height/2 + 150);
  } else if (c > 49 && c < 99){
    // Draw text
    text("> arcane.info login:   ", width/2, height/2 + 150);
  } else {
    // Draw text
    text("> arcane.info login: | ", width/2, height/2 + 150);
    c = 0;
  }
  // Increment frame counter
  f++;
  // Increment cursor blink counter
  c++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 120){
    exit();
  }
}