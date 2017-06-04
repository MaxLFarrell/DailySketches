///-----------------------------------------------------------------
///   Name:           sketch_00028_a_boat
///   Description:    Draws a "boat"
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 10th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f;

// Background water image, src: http://orig13.deviantart.net/b0c6/f/2007/178/3/1/water_texture_10_by_greeneyezz_stock.jpg
PImage water;

// Deck image, src: http://farm3.staticflickr.com/2453/3567255587_1dc0c47b8b_o.jpg
PImage deck;

// "Boat" shape
PShape boat;

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of flag to 800px by 800px and turn on 3d processing
  size(800, 800, P3D);
  // Turn off stroke
  noStroke();
  // Load water image
  water = loadImage("http://orig13.deviantart.net/b0c6/f/2007/178/3/1/water_texture_10_by_greeneyezz_stock.jpg");
  // Rescale to fit background
  water.resize(800, 800);
  // Load deck image
  deck = loadImage("http://farm3.staticflickr.com/2453/3567255587_1dc0c47b8b_o.jpg");
  // Load watermark
  watermark = loadImage("../watermark_black.png");
}

// Draw the scene
void draw() {
  // Draw background with water image
  background(water);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set up 3d camera
  translate(width/2, height/2, 0);
  // Rotate based on frame
  rotateY(radians(f*18));
  rotateX(PI/2);
  // Create pyramid 200px tall
  createPyramid(200);
  // Draw "boat"
  shape(boat);
  // Turn on lights (i'm going to be honest I don't think this does anything for us here)
  lights();
  // Increment frame
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 20){
    exit();
  }
}

void createPyramid(int t) { 

  noStroke();
  //stroke(50);
  boat = createShape();
  // this pyramid has 4 sides, each drawn as a separate triangle
  // each side has 3 vertices, making up a triangle shape
  // the parameter " t " determines the size of the pyramid
  boat.beginShape(TRIANGLES);
  boat.texture(deck);
  
  boat.vertex(-t, -t, -t, 0, 800);
  boat.vertex( t, -t, -t, 800, 800);
  boat.vertex( 0, 0, t, 0, 0);

  boat.vertex( t, -t, -t, 0, 800);
  boat.vertex( t, t, -t, 800, 800);
  boat.vertex( 0, 0, t, 0, 0);

  boat.vertex( t, t, -t, 0, 800);
  boat.vertex(-t, t, -t, 800, 800);
  boat.vertex( 0, 0, t, 0, 0);

  boat.vertex(-t, t, -t, 0, 800);
  boat.vertex(-t, -t, -t, 800, 800);
  boat.vertex( 0, 0, t, 0, 0);

  boat.endShape();
}