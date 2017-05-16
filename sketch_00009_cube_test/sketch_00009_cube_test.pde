///-----------------------------------------------------------------
///   Name:           sketch_00009_cube_test
///   Description:    Rotating cube test
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 16th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Height/width offsets
int[] heights = new int[]{-150, 0, 150};

// Frame counter
int f = 0;

// Set up scene
void setup() {
  // Set size of flag to 1920px by 1080px and turn on 3d processing
  size(800, 800, P3D);
  // Make stroke light grey
  stroke(100);
  // Set stroke to thin
  strokeWeight(1);
  // Set background to black
  background(0);
  // Turn off fill
  noFill();
}

// Draw a cube with center x and y
void drawCube(int x, int y){
  // Start new cube
  pushMatrix();
  // Move cube
  translate(x, y, 0); 
  // Set up 3d camera
  rotateY((millis()/100));
  // Make box with width of 100px
  box(100);
  // Finish cube
  popMatrix();
}

// Draw the scene
void draw() {
  background(0);
  for (int heightOffset: heights){
    for (int widthOffset: heights){
      drawCube(width/2 + widthOffset, height/2 + heightOffset);
    }
  }
  f++;
  save("frame_" + nf(f, 5) + ".jpg");
}