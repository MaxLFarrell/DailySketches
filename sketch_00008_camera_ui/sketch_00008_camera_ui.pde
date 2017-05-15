///-----------------------------------------------------------------
///   Name:           sketch_00008_camera_ui
///   Description:    Simple desktop camera ui
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 15th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Video library is not included in initial install
import processing.video.*;
// Install through libraries tool
import controlP5.*;

// Create ui object
ControlP5 cp5;

// Create camera object
Capture cam;

// Set up scene
void setup() {
  // Set size of the frame to 640px by 600px
  size(640,600);
  
  // Instantiate new ui object
  cp5 = new ControlP5(this);
  
  // Create list of ui images
  PImage[] imgs = {loadImage("capture.png"),loadImage("stop.png")};
  // Add capture button with icon of capture.png
  cp5.addButton("capture")
     .setValue(128)
     .setPosition(width/2 - width/5, height/2 + height/3)
     .setImage(imgs[0])
     .updateSize()
     ;
  // Add stop button with icon of stop.png
  cp5.addButton("stop")
     .setValue(128)
     .setPosition(width/2 + width/5, height/2 + height/3)
     .setImage(imgs[1])
     .updateSize()
     ;
  // Get list of cameras + sizes and fps
  String[] cameras = Capture.list();
  // If there are no cameras kill the program
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  }
    
   // Set capture camera to the first camera able to capture
   // 640px by 480px at 30 frames per second
   cam = new Capture(this, 640, 480, 30);
   // Start camera capture
   cam.start();
   // Set background color to black
   background(0);
}
// Draw the scene
void draw() {
  // If camera is still up read the current frame and show it
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
}
// On any control event, print the name of the event
public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}
// When capture button is clicked, save image to capture.png
public void capture(int theValue) {
  // When buttons are made they are programatically clicked once,
  // this keeps the event from executing then
  if (millis() > 5000){
    println("Capturing image");
    PImage partialSave = get(0,0,640,480);
    partialSave.save("capture.png");
  }
}
// When stop button is clicked exit program
public void stop(int theValue){
  // When buttons are made they are programatically clicked once,
  // this keeps the event from executing then
  if (millis() > 5000){
    exit();
  }
}