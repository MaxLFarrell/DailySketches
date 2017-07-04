///-----------------------------------------------------------------
///   Name:           sketch_00058_rotation_server
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

// Rotation server
Server rotServer;

// X rotation tracker
int rotX = 0;

// Y  rotation tracker
int rotY = 0;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Draw frame at top left
  surface.setLocation(0, 0);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Instantiate rotation server
  rotServer = new Server(this, 5204);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2);
  // Get available client
  Client client = rotServer.available();
  // If client is not empty read string from client
  if (client != null){
    String res = client.readString();
    // If string from client is not empty, split into the axis, and the number given
    if (res.contains(",")){
      String axis = res.split(",")[1];
      int tmpnum = Integer.parseInt(res.split(",")[0]);
      // If axis is X add given number to X rotation, else add to Y rotation
      if (axis.equals("X")){
        rotX += tmpnum;
      } else {
        rotY += tmpnum;
      }
    }
  }
  // Rotate rotX degrees
  rotateX(radians(rotX));
  // Rotate rotY degrees
  rotateY(radians(rotY));
  // Draw cube
  box(300);
}