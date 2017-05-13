///-----------------------------------------------------------------
///   Name:           sketch_00006_watcher
///   Description:    Watches 
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 13th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Offset tracker
int offset = 0;

// Add or subtract tracker
boolean offsetSub = false;

// Frame counter
int frame = 0;

// Set up scene
void setup() {
  // Set size of the frame to 800px by 800px
  size(800, 800);
  // Make stroke white
  stroke(255);
  // Set stroke to medium with
  strokeWeight(10);
  // Set background to black
  background(0);
  // Set fill to light grey
  fill(255);
}

// Draw the scene
void draw() {
  // Set fill color to black
  fill(0);
  // Draw arc for outside of eyeball
  arc(width/2, height/2, 600, 200, 0, 2 * PI);
  // Set fill color to black
  fill(255);
  // Set text size to 100
  textSize(100);
  // Align text to center, bottom
  textAlign(CENTER, BOTTOM);
  // Draw text
  text("THIS AREA", width/2, height/4);
  // Align text to center, top
  textAlign(CENTER, TOP);
  // Draw text
  text("UNDER WATCH", width/2, height - height/4);
  // If offset is greater than 100 start subtracting
  if (offset > 100){
    offsetSub = true;
  } else if (offset < -100){ // If offset is less than -100 start adding
    offsetSub = false;
  };
  // Draw outside of eyeball
  ellipse(width/2 + offset, height/2 , 200, 200);
  // Set fill to black
  fill(0);
  // Draw center of eyeball
  ellipse(width/2 + offset, height/2, 110, 110);
  // Save frame
  save("frame_" + nf(frame, 5) + ".jpg");
  // Increment or decrement offset
  if (offsetSub == true){
    offset--;
  } else {
    offset++;
  }
  // Increment frame counter
  frame++;
  // Kill program when frame is back at center
  if (frame == 401){
    exit();
  }
  background(0);
}