///-----------------------------------------------------------------
///   Name:           sketch_000010_containment
///   Description:    Containing the cube
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 17th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame counter
int f = 0;

// Rotation axis choice
int rotRandom = 0;

// Rotation axis list
String[] rotAxes = new String[]{"x","y","z"};

// Set up scene
void setup() {
  // Set size of flag to 1920px by 1080px and turn on 3d processing
  size(800, 800, P3D);
  // Make stroke green
  stroke(0, 255, 0);
  // Set stroke to medium
  strokeWeight(5);
  // Set background to black
  background(0);
  // Turn off fill
  noFill();
}

// Draw a cube with center x and y
void drawCube(int x, int y, String rotateAxis, int size, int speed){
  // Start new cube
  pushMatrix();
  // Move cube
  translate(x, y, 0); 
  // Set up 3d camera
  if (rotateAxis == "x"){
    rotateX(radians(f*speed));
  } else if (rotateAxis == "y"){
    rotateY(radians(f*speed));
  } else if (rotateAxis == "z"){
    rotateZ(radians(f*speed));
  } else {
    // Set a static y rotation for cubes that choose this
    rotateY(parseFloat(rotateAxis));
  }
  // Make box with width of size
  box(size);
  // Finish cube
  popMatrix();
}

// Draw the scene
void draw() {
  // Redraw background
  background(0);
  // Draw jail cube
  drawCube(width/2, height/2, "0.25", 200, 0);
  // Set fill and stroke to white for prisoner cube
  fill(255);
  stroke(255);
  // Choose random axis to try and escape from
  rotRandom = (int) random(1, 3);
  // Draw jailed cube
  drawCube(width/2, height/2, rotAxes[rotRandom], 100, 3 * (f/30));
  // Turn off fill
  noFill();
  // Set stroke back to green
  stroke(0, 255, 0);
  // Increment frame counter
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  // Finish at 101st frame
  if (f > 100){
    exit();
  }
}