///-----------------------------------------------------------------
///   Name:           sketch_00066_3d_viewer
///   Description:    Tiny 3d viewer
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 12th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// File chooser library
import javax.swing.*;

// File library
import java.io.File; 

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// 3d model
PShape model;

// Is model loaded
boolean modelLoaded = false;

// Rotations
float rotationX = 0;
float rotationY = 0;

// Zoom
float zoom = 1;

// Rotation check
boolean rotationOn = false;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark_black.png");
  // Set upper right corner of frame to upper right corner of screen
  surface.setLocation(0, 0);
}

// Draw the scene
void draw(){
  // Draw black background
  background(255);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  
  // Load button
  fill(0);
  rect(-250, 275, 100, 25);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Load", -200, 285);
  
  // Zoom in button
  noStroke();
  fill(0);
  rect(-125, 250, 50, 50);
  fill(255);
  rect(-105, 260, 10, 30);
  rect(-115, 270, 30, 10);
  
  // Zoom out button
  fill(0);
  rect(-50, 250, 50, 50);
  fill(255);
  rect(-40, 270, 30, 10);
  
  // Rotate model rotationY degrees on the X axis
  rotateX(radians(rotationY));
  // Rotate model rotationX degrees on the Y axis
  rotateY(radians(rotationX));
  // Scale model
  scale(zoom);
  // Draw 3d model
  if (modelLoaded){
    shape(model);
  }
  f++;
}

void mouseClicked(){
  if ((mouseX > 150) && (mouseX < 250)){ // Load button
    if ((mouseY > 675) && (mouseY < 725)){
      loadModel();
    }
  } else if ((mouseX > 275) && (mouseX < 325)){ // Zoom in button
    if ((mouseY > 650) && (mouseY < 700)){
      zoom += 1;
    }
  } else if ((mouseX > 350) && (mouseX < 400)){ // Zoom out button
    if ((mouseY > 650) && (mouseY < 700)){
      zoom -= 1;
    }
  } else {
    rotationOn = true;
  }
}

// Calculate x and y rotation from mouse drag
void mouseDragged(){
  rotationX = mouseX - 400;
  rotationY = mouseY - 400;
  
}

// Action on key pressed
void keyPressed(){
  // Save frame
  if (key == 's'){
    save("data/frame_" + nf(f, 5) + ".png");
  }
}

// Method to load 3d model
void loadModel(){
  // File chooser object
  JFileChooser fileChooser = new JFileChooser();
  // Set file chooser directory to data folder
  fileChooser.setCurrentDirectory(new File(dataPath("")));
  // Result of file choosing
  int result = fileChooser.showOpenDialog(frame);
  if (result == JFileChooser.APPROVE_OPTION) { // If a file is chosen
    // Chosen file
    File selectedFile = fileChooser.getSelectedFile();
    // Try to load file, if loading doesn't work show error in messsage dialog
    try {
      if (selectedFile.getAbsolutePath().contains(".obj")){
        // Load model to pshape
        model = loadShape(selectedFile.getAbsolutePath());
        // Set modelLoaded to true
        modelLoaded = true;
      } else {
        throw new NotObjException("Not obj");
      }
    } catch (Exception e) {
      JOptionPane.showMessageDialog(null, e.toString(), "Error", JOptionPane.ERROR_MESSAGE);
    }
  }
}

// Custom exception for non obj files
public class NotObjException extends Exception {
  public NotObjException(String message){
     super(message);
  }
}