///-----------------------------------------------------------------
///   Name:           sketch_00021_cube_rot
///   Description:    Multiple object type cube rotation test
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 28th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Green tracker
int g = 1;

// Addition tracker
boolean toAdd = true;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Set background to black
  background(0);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Start object
  pushMatrix();
  // Set object position to middle of screen
  translate(width/2, height/2, 0);
  // Allow transparency on 3d objects
  hint(DISABLE_DEPTH_TEST);
  // Set fill of sphere based on time
  fill(255, g*3, 0, 255);
  // Turn off stroke for sphere
  noStroke();
  // Draw sphere with radius 150px
  sphere(150);
  // Set fill to have transparency based on time
  fill(255, 255, 255, (int) (255 * (((float) g)/81)));
  // Set stroke to white for cube
  stroke(255);
  // Rotate cube y value based on frame
  rotateY(radians(f*3));
  // Draw 400px cube
  box(400);
  // Turn on lights
  lights();
  // Finish object
  popMatrix();
  // Increment frame counter
  f++;
  // If g is greater than 81 start decreasing, if less than 2 start increasing
  if (g > 81 || g < 2){
    if (g > 81){
      toAdd = false;
    } else {
      toAdd = true;
    }
  }
  if (toAdd == false){
    g--;
  } else {
    g++;
  }
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 120){
    exit();
  }
}