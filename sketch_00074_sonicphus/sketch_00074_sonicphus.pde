///-----------------------------------------------------------------
///   Name:           sketch_00074_sonicphus
///   Description:    Trap Sonic in a cage of his own design, Ring model: SHadowth117, Sonic model: josh98
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 20th, 2017
///   Notes:          Sonic model: https://www.models-resource.com/gamecube/sonicadventuredxdirectorscut/model/4107/
///                   Ring model: https://www.models-resource.com/gamecube/sonicadventuredxdirectorscut/model/54/
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------


// Image for watermark texture
PImage watermark;

// Sonic model
PShape sonic;

// Ring model
PShape ring;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(500, 500, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Load sonic
  sonic = loadShape("Sonic.obj");
  // Load ring
  ring = loadShape("Ring/Ring.obj");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 110, height - 67, 100, 57);
  // Set center to center of image
  translate(width/2, height/2 + 40, 0);
  // Rotate sonic to be standing up right
  rotateX(PI);
  // Rotate 3 degrees per frame on z axis
  rotateZ(-radians(frameCount*3));
  // Rotate so object faces are visible
  rotateY(radians(230));
  // Scale sonic to be highly visible
  scale(20);
  // Draw sonic
  shape(sonic);
  // Draw ring
  shape(ring);
  // Exit when full rotation is done
  if (frameCount > 120){
    exit();
  }
  // Save frame
  save("data/out/frame_" + nf(frameCount, 5) + ".png");
}