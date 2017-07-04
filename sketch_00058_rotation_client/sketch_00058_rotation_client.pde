///-----------------------------------------------------------------
///   Name:           sketch_00058_rotation_client
///   Description:    Rotate cube based on client input
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 4th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Networking library
import processing.net.*;

// Image for watermark texture
PImage watermark;

// Rotation client
Client rotClient;

// Rotation string to send to server
String rot = "";

// X rotation tracker
int rotX = 0;

// Y rotation tracker
int rotY = 0;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Draw frame at top right
  surface.setLocation(800, 0);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Instantiate client
  rotClient = new Client(this, "127.0.0.1", 5204);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2);
  // Rotate rotX degrees
  rotateX(radians(rotX));
  // Rotate rotY degrees
  rotateY(radians(rotY));
  // Draw cube
  box(300);
  // Write rotation string
  rotClient.write(rot);
  // Clear rotation string so we don't write it twice
  rot = "";
}

// If key is pressed
void keyPressed(){
  // If up rotate 1 degree up
  if (keyCode == UP){
    rot = "1,X";
    rotX += 1;
  } else if (keyCode == DOWN){ // If down rotate 1 degree down
    rot = "-1,X";
    rotX -= 1;
  } else if (keyCode == RIGHT){ // If right rotate 1 degree right
    rot = "1,Y";
    rotY += 1;
  } else if (keyCode == LEFT){ // If left rotate 1 degree left
    rot = "-1,Y";
    rotY -= 1;
  }
}