///-----------------------------------------------------------------
///   Name:           sketch_000013_random_solar_system
///   Description:    Generates a random solar system and shows it spinning
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 20th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame counter
int f = 0;

// Number of planets tracker
int planets = 0;

// Position trackers for planets
int x = 0;
int y = 0;

// Spacing tracker for planets
int spacing = 0;

// Temporary size tracker for planet
int tmpSize = 0;

// Planet array
int[][] planetArr;

// Set up scene
void setup() {
  // Set size of flag to 800px by 800px and turn on 3d processing
  size(800, 800, P3D);
  // Turn off stroke
  noStroke();
  // Set stroke to medium
  strokeWeight(5);
  // Set background to black
  background(0);
}

// Draw a sphere with center x and y
void drawSphere(int x, int y, String rotateAxis, int size, int speed){
  // Start new sphere
  pushMatrix();
  // Move sphere
  translate(x, y, 0); 
  // Set up 3d camera
  if (rotateAxis == "x"){
    rotateX(radians(f*speed));
  } else if (rotateAxis == "y"){
    rotateY(radians(f*speed));
  } else if (rotateAxis == "z"){
    rotateZ(radians(f*speed));
  } else {
    // Set a static y rotation for spheres that choose this
    rotateY(parseFloat(rotateAxis));
  }
  lights();
  // Draw sphere
  sphere(size);
  // Finish cube
  popMatrix();
}

// Draw the scene
void draw() {
  if (f == 0){
    // Get number of planets to make
    planets = (int) random(3, 7);
    // Instantiate planet array
    planetArr = new int[planets][5];
    // Calculate spacing of planets
    spacing = 300 / planets;
    for (int it=0;it<planets;it++){
      for (int cc=0;cc<3;cc++){
        planetArr[it][cc] = (int) random(0, 255);
      }
      planetArr[it][3] = spacing * it;
      planetArr[it][4] = (int) random(10, spacing/2);
    }    
  }
  // Redraw background
  // Rotation code adopted from:
  // https://forum.processing.org/two/discussion/2437/how-to-rotate-many-objects-around-a-circle
  background(0);
  for (int it=0;it<planets;it++){
    // Get fill from planet array
    fill(planetArr[it][0], planetArr[it][1], planetArr[it][2]);
    // Calculate position from planet array
    x = (int) (planetArr[it][3]*cos(radians(f*it)) + width/2);
    y = (int) (planetArr[it][3]*sin(radians(f*it)) + height/2);
    // Draw the eye
    drawSphere(x, y, "z", planetArr[it][4], 3);
  }
  lights();
  // Increment frame counter
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 360){
    exit();
  }
}