///-----------------------------------------------------------------
///   Name:           sketch_000011_watcher_3d
///   Description:    Watches in 3 dimensions
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 18th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame counter
int f = 0;

// Create texture from eye texture
PImage texture = loadImage("https://www.sharecg.com/images/medium/6276.png");

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
  // Make sphere with width of size
  PShape globe = createShape(SPHERE, size);
  // Set texture of sphere to predefined texture
  globe.setTexture(texture);
  // Draw globe
  shape(globe);
  // Finish cube
  popMatrix();
}

// Draw the scene
void draw() {
  // Redraw background
  background(0);
  // Draw the eye
  drawSphere(width/2, height/2, "y", 200, 3);
  // Set fill color to whited
  fill(255);
  // Set text size to 100
  textSize(100);
  // Align text to center, bottom
  textAlign(CENTER, BOTTOM);
  // Draw text
  text("THIS AREA", width/2, height/4);
  // Align text to center, top
  textAlign(CENTER, TOP);
  // Draw text
  text("UNDER WATCH", width/2, height - height/4);
  // Increment frame counter
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 150){
    exit();
  }
}