///-----------------------------------------------------------------
///   Name:           sketch_000015_circle_stroke
///   Description:    Paints a circle with a paint brush style
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 22th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------
// Frame counter
int f=0;

// Number of bristles
int bristles=0;

// Width of bristles
int bristleWidth=0;

// Array of lengths of bristles
int[] bristleLengths;

// Extend length tracker
boolean eLength;

// Set up scene
void setup () {
  // Set size of image to 700px by 700px
  size (700,700);
  // Set background to black
  background (0);
  // Smooth lines
  smooth();
  // Turn off stroke
  noStroke();
  // Set fill color to white
  fill(255);
}

// Function to paint one stroke
void paint(){
  // Start Stroke
  pushMatrix();
  // Set center of image as center of stroke
  translate(width/2, height/2);
  // Rotate 1 degree per frame
  rotate(radians(f));
  // For each bristle draw a rectangle
  for (int b=0;b<bristles;b++){
    // Decide of we will extend the length of the bristle
    eLength = random(1) > 0.5;
    if (eLength == true) {
      rect(b-3, b, bristleWidth, bristleLengths[b]);
    } else {
      rect(b, b, bristleWidth, bristleLengths[b]);
    }
  }
  // End stroke
  popMatrix();
}

// Draw scene
void draw () {
  // Choose number of bristles
  bristles = (int) random(3, 25);
  // Calculate width of individual bristles
  bristleWidth = 25/bristles;
  // Instantiate bristle length array
  bristleLengths = new int[bristles];
  // Choose lengths of bristles in array
  for (int b=0;b<bristles;b++){
    bristleLengths[b] = (int) random(25, 100);
  }
  // Draw the stroke
  paint();
  // Increment frame counter
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 360){
    exit();
  }
}