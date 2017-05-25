///-----------------------------------------------------------------
///   Name:           sketch_00018_data_steram
///   Description:    A stream of data!
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 25th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame counter
int f = 0;

// Storage for random data
String dataString = "";

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(600, 600);
  // Set text size to 20
  textSize(20);
  // Turn off fill
  noFill();
  // Set background to black
  background(0);
  // Set stroke to white
  stroke(255);
  // Generate random string of floats
  for (int it=0;it<1000;it++){
    dataString += random(0, 9);
  }
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Turn fill to white
  fill(255);
  // Draw random data string
  text(dataString, -100 + f*3, height/2 - 175, width + 125, 300);
  
  // Draw top curve of stream
  beginShape();
  curveVertex(0,  height/2 - 150);
  curveVertex(0,  height/2 - 150);
  curveVertex(100, height/2 - 50);
  curveVertex(300, height/2 - 75);
  curveVertex(width - 200, height/2);
  curveVertex(width, height/2);
  curveVertex(width, height/2);
  endShape();
  
  // Draw fill over top of the stream
  fill(0);
  beginShape();
  curveVertex(0,  height/2 - 150);
  curveVertex(0,  height/2 - 150);
  curveVertex(100, height/2 - 50);
  curveVertex(300, height/2 - 75);
  curveVertex(width - 200, height/2);
  curveVertex(width, height/2);
  curveVertex(width, 0);
  curveVertex(0, 0);
  curveVertex(0,  height/2 - 150);
  endShape();
  noFill();
  
  // Draw bottom curve of stream
  beginShape();
  curveVertex(0,  height/2 - 50);
  curveVertex(0,  height/2 - 50);
  curveVertex(100, height/2 + 50);
  curveVertex(300, height/2 + 25);
  curveVertex(width - 200, height/2 + 100);
  curveVertex(width, height/2 + 100);
  curveVertex(width, height/2 + 100);
  endShape();
  
  // Draw fill over bottom of stream
  fill(0);
  beginShape();
  curveVertex(0,  height/2 - 50);
  curveVertex(0,  height/2 - 50);
  curveVertex(100, height/2 + 50);
  curveVertex(300, height/2 + 25);
  curveVertex(width - 200, height/2 + 100);
  curveVertex(width, height/2 + 100);
  curveVertex(width, height);
  curveVertex(0, height);
  curveVertex(0,  height/2 - 50);
  endShape();
  noFill();
  
  // Increment frame counter
  f++;
  // Save frame
  save("frame_" + nf(f, 5) + ".jpg");
  if (f > 33){
    exit();
  }
}