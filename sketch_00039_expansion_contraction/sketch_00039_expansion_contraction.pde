///-----------------------------------------------------------------
///   Name:           sketch_00039_expansion_contraction
///   Description:    Expand and contract the number of sides of a 3d object
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 15th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------
import extruder.*;

// Frame tracker
int f = 0;

// Side tracker
int s = 3;

// Side operation tracker
boolean ssub = false;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
}
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set stroke to white
  stroke(255);
  // Turn fill off
  noFill();
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Rotate camera 45 degrees on the y axis
  rotateY(radians(45));
  // Initialize temporary pshape
  PShape tmp = createShape();
  // Start shape
  tmp.beginShape();
  // Draw vertices
  int size = 200;
  for (int it=0;it<s;it++){
    // The degree offset for the size in based on the number of angles
    int sideso = 360 / s;
    int x = (int) (size * cos(radians(sideso * it)));
    int y = (int) (size * sin(radians(sideso * it)));
    // Add vertex
    tmp.vertex(x, y);
  }
  // End shape
  tmp.endShape();
  // Instantiate extruder
  extruder e = new extruder(this);
  // Draw shape with 200 px depth and triangle edges
  PShape[] res = e.extrude(tmp, 200, "box");
  // Draw all returned pshapes (sides and caps)
  for (PShape p:res){
    shape(p);
  }
  // Every 5 frames reevaluate number of sides
  if ((f % 5) == 0){
    if (ssub){
      s--;
    } else {
      s++;
    }
    if (s > 20){
      ssub = true;
    } else if (s < 4){
      ssub = false;
    }
  }
  // Increment frame counter
  f++;
  if (f > 180){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".jpg");
}