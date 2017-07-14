///-----------------------------------------------------------------
///   Name:           sketch_00068_system_usage
///   Description:    Show usage of sketch
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 12th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// Runtime of current sketch
Runtime runtime;

// Set up scene
void setup() {
  // Set size of image to 500px by 500px
  size(500, 500, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set upper right corner of frame to upper right corner of screen
  surface.setLocation(0, 0);
  // Instantiate runtime
  runtime = Runtime.getRuntime();
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Calculate memory usage by sketch
  long usedMem = Runtime.getRuntime().totalMemory() - Runtime.getRuntime().freeMemory();
  // Calculate megabytes of memory used by sketch
  usedMem /= (1024*1024);
  // Draw memory usage
  text("Memory Used: " + usedMem + " mb", 10, 600);
  // Draw frame count
  text("Frame: " + frameCount, 10, 620);
  // Draw frames per second
  text("FPS: " + frameRate, 10, 640);
  // Draw width of sketch
  text("Width: " + width, 10, 660);
  // Draw height of sketch
  text("Height: " + height, 10, 680);
  // Draw position of mouse
  text("Position: " + mouseX + ", " + mouseY, 10, 700);
  // Draw rotation of cube
  text("Rotation: " + (((int) frameCount*3) % 360) + "°", 10, 720);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Rotate cube 3 degrees per frame
  rotateY(radians(frameCount*3));
  // Draw cube
  box(200);
  // Exit sketch after 120th frame
  if (frameCount > 119){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(frameCount, 5) + ".png");
}