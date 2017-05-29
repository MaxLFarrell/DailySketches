///-----------------------------------------------------------------
///   Name:           sketch_00022_3d_text
///   Description:    Rotating 3d text
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 29th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Set background to black
  background(0);
  // Set stroke to white
  stroke(200);
  // Set text mode to shape
  textMode(SHAPE);
}

// Add text at set of z depths
void depthText(String string, int depth){
  for (int it=0;it<depth;it++){
    // Start text
    pushMatrix();
    // Set center of object to center of image and z depth of 200px times iterator
    translate(width/2, height/2, 200 * it);
    // Align text to center height and width
    textAlign(CENTER, CENTER);
    // Set text size to 50px
    textSize(50);
    // Rotate text around x by frame counter
    rotateX(radians(f*3));
    // Draw text
    text(string, 0, 0);
    // Finish text
    popMatrix();
    // Turn on lights
    lights();
  }
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Make fill weight
  fill(255);
  // Draw text A.I 5 times 
  depthText("A.I", 5);
  // Increment frame
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 120){
    exit();
  }
}