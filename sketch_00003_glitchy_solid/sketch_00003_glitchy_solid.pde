///-----------------------------------------------------------------
///   Name:           sketch_00003_glitchy_solid
///   Description:    Generates random glitchy 3d solids
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 10th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Set up scene
void setup() {
  // Set size of flag to 1920px by 1080px and turn on 3d processing
  size(1920, 1080, P3D);
  // Make stroke light grey
  stroke(100);
  // Set stroke to thin
  strokeWeight(1);
  // Set background to black
  background(0);
  // Set fill to white
  fill(255);
  // Turn off looping
  noLoop();
}

// Generate new vertex location in the form of a float array
float[] genLoc(){
  // Create empty vertex location array
  float[] location = new float[3];
  // Fill the location array
  for (int it=0;it<3;it++){
    // Randomly generate value from between -400 and 400
    location[it] = random(-400, 400);
  }
  // Return location array
  return location;
}

// Draw the scene
void draw() {
  // Set up 3d camera
  translate(width/2, height/2, 0);
  rotateX(PI/2);
  rotateZ(-PI/6);
  // Start the shape
  beginShape();
  // Determine number of sides to create
  int sides = (int) (random(4, 25));
  // Determine center point
  float[] center = genLoc();
  for (int i=0;i<sides;i++){
    // Generate current location for use with initial vertex
    float[] curLocation = genLoc();
    // Draw first vertex
    vertex(curLocation[0], curLocation[1], curLocation[2]);
    // Determine number of extra vertices to draw (besides the necessary ones)
    int extraVertices = (int) (random(1, 5));
    // Generate location for use with first additional vertex and to use as a staggered location
    float[] newLocation = genLoc();
    // Draw first additional vertex
    vertex(curLocation[0], newLocation[1], newLocation[2]);
    if (extraVertices > 1){
      for (int ii=0;ii<extraVertices;ii++){
        float[] evLocation = genLoc();
        vertex(newLocation[0], evLocation[1], evLocation[2]);
        newLocation = evLocation;
      }
    }
    // Draw vertex to be attached to center vertex
    vertex(center[2], newLocation[1], newLocation[2]);
    // Draw center vertex
    vertex(center[0], center[1], center[2]);
  }
  // Close shape
  endShape();
  // Turn on lights (i'm going to be honest I don't think this does anything for us here)
  lights();
  // Save image
  save(random(500000, 10000000) + ".jpg");
  // Exit program
  exit();
}