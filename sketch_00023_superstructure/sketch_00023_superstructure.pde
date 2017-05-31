///-----------------------------------------------------------------
///   Name:           sketch_00023_superstructure
///   Description:    Superstructure containing the moon
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 30th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Image for moon texture
PImage img;

// Image for watermark texture
PImage watermark;

// Globe shape
PShape globe;


// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Set background to black
  background(0);
  // Load watermark image
  watermark = loadImage("watermark.png");
  // Load moon image
  img = loadImage("http://img12.deviantart.net/d982/i/2010/119/7/2/earth_moon_texture_pack_by_zephroth.jpg");
  // Create shpere of radius 200px
  globe = createShape(SPHERE, 200);
  // Set texture of moon to moon texture
  globe.setTexture(img);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Start moon shape
  pushMatrix();
  // Make fill white
  fill(255);
  // Turn off stroke
  noStroke();
  // Set center of globe to center of image
  translate(width/2, height/2, 0);
  // Rotate based on frame
  rotateY(radians(f*36));
  // Rotate moon 180 degrees on x axis
  rotateX(0.5);
  // Draw moon
  shape(globe);
  // Close moon shape
  popMatrix();
  // Start superstructure shape
  pushMatrix();
  // Set center of superstructure to center of image
  translate(width/2, height/2, 0);
  // Set stroke to white
  stroke(255);
  // Turn off fill
  noFill();
  // Rotate based on frame
  rotateY(radians(f*36));
  // Rotate superstructure 36 degrees on x axis
  rotateX(0.1);
  // Draw 300px radius sphere
  sphere(300);
  // Close superstructure shape
  popMatrix();
  // Turn on lights
  lights();
  // Increment frame
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".png");
  if (f > 10){
    exit();
  }
}