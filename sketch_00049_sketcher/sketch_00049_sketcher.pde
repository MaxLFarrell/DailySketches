///-----------------------------------------------------------------
///   Name:           sketch_00049_sketcher
///   Description:    Plane sketching tool
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 25th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import obj saving library
import nervoussystem.obj.*;

// Frame tracker
int f = 0;

// Whether to calculate the fade animation
boolean tcalc = false;

// Transparency offset
int toffset = 0;

// Filename
String filename = "filename";

// Rotation on the X axis
int rotateOffsetUp = 0;

// Rotation on the Y axis
int rotateOffset = 0;

// Whether to save the plane or not
boolean record = false;

// List of vectors making up the plane
ArrayList<PVector> vl;

// Set up scene
void setup() {
  // Set size of frame to 800px by 800px
  size(800, 800, P3D);
  // Initialize pvector arraylist
  vl = new ArrayList<PVector>();
}

// Draw the scene
void draw() {
  // Draw over the previous frame with black
  background(0);
  // Set fill to white
  fill(255);
  // Set stroke to white
  stroke(255);
  // Rotate rotateOffset degrees on the Y Axis
  rotateY(radians(rotateOffset));
  // Rotate rotateOffsetUp degrees on the X Axis
  rotateX(radians(rotateOffsetUp));
  // Start recording the 3d object
  if (record) {
    beginRecord("nervoussystem.obj.OBJExport", filename + ".obj"); 
  }
  // Start drawing plane
  beginShape();
  // Draw all vectors
  for (PVector v:vl){
    vertex(v.x, v.y, v.z);
  }
  // Stop drawing plawing
  endShape();
  // End recording, save object and turn off recording
  if (record) {
    endRecord();
    record = false;
  }
  // Draw line from last coordinate to mouse
  if (vl.size() > 0){
    line(vl.get(vl.size()-1).x, vl.get(vl.size()-1).y, mouseX, mouseY);
  }
  // Set text size to 10px
  textSize(10);
  // Draw x, y, help, and filename
  text(" X: " + mouseX + " Y:" + mouseY + " Click ctrl to save, Filename: " + filename , 0, height - 20);
  // If current mouse location is already in the list draw a bright green ellipse at current location
  if (vl.contains(new PVector(mouseX, mouseY, 0))){
    fill(0, 255, 0);
    ellipse(mouseX, mouseY, 10, 10);
  }
  // Draw Saved... in the middle of the screen and fade out slowly
  if (tcalc){
    // Set fill to red with transparency
    fill(255, 0, 0, 25 * toffset);
    // Align text to center
    textAlign(CENTER, CENTER);
    // Set text size to 30px
    textSize(30);
    // Draw text in middle of screen
    text("Saved...", width/2, height/2);
    // Decrement transparency offset
    toffset--;
    // If transparency offset is 0 turn off transparency method
    if (toffset == 0){
      tcalc = false;
    }
    // Set text aligment back to left
    textAlign(LEFT);
  }
  f++;
}

// If mouse is pressed add new vector add current mouse location
void mousePressed() {
  vl.add(new PVector(mouseX, mouseY, 0));
}

// Any key pressed method
void keyPressed() {
  // Rotate Y + 10 degrees
  if (keyCode == RIGHT){
    rotateOffset += 10;
  } else if (keyCode == LEFT){ // Rotate Y - 10 degrees
    rotateOffset -= 10;
  } else if (keyCode == UP){ // Rotate X + 10 degrees
    rotateOffsetUp += 10;
  } else if (keyCode == DOWN){ // Rotate X - 10 degrees
    rotateOffsetUp -= 10;
  } else if (keyCode == CONTROL){ // Save obj and start drawing saved... text
    record = true;
    toffset = 60;
    tcalc = true;
    // Save screenshot, this is only for showing the ui, can remain commented
    save(filename + "_" + nf(f, 5) + ".png");
  } else if (keyCode == BACKSPACE){ // Erase text from filename
    if (filename.length() > 0){
      filename = filename.substring(0, filename.length() - 1);
    } 
  } else { // Add to filename
    filename += key;
  }
}