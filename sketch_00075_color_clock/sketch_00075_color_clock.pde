///-----------------------------------------------------------------
///   Name:           sketch_00075_color_clock
///   Description:    Change background color based on time, check it out in action here: https://www.openprocessing.org/sketch/440928
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 21st, 2017
///   Notes:          OpenProcessing Sketch: https://www.openprocessing.org/sketch/440928
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// Set up scene
void setup() {
  // Set size of image to 500px by 500px
  size(500, 500);
  // Load watermark
  watermark = loadImage("../watermark.png");
}

// Draw the scene
void draw(){
  // Draw background based on hour, second, and minute
  background((255/24) * hour(), (255/60) * minute(), (255/60) * second());
  // Set text size to 50px
  textSize(50);
  // Align text to center on both x and y axes
  textAlign(CENTER, CENTER);
  // Draw zero padded hour, minute, and second
  text(nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2), width/2, height/2);
  // Draw watermark in bottom right corner
  image(watermark, width - 110, height - 67, 100, 57);
  // Only used to show how it works
  /*
  // Exit after 2 minutes
  if ((frameCount)/30 > 120){
    exit();
  }
  // Save frame every 30 frames
  if ((frameCount % 30) == 0){
    // Save frame
    save("data/frame_" + nf(frameCount, 5) + ".png");
  }
  */
}