///-----------------------------------------------------------------
///   Name:           sketch_00064_digital_clock
///   Description:    Draw and animate digital clock
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 10th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Scale of numbers
int scale = 100;

// Relative positions of the 7 seven segments
float[][] positions = new float[][]{
  {-0.5, -1, 1.25, 0.25},
  {0.5, -1, 0.25, 1},
  {0.5, 0, 0.25, 1},
  {-0.5, 1, 1.25, 0.25},
  {-0.5, 0, 0.25, 1},
  {-0.5, -1, 0.25, 1},
  {-0.5, 0, 1.25, 0.25}
};

// Segments that make up the numbers 1 - 9 
int[][] letters = new int[][]{
  {0, 1, 2, 3, 4, 5},
  {1, 2},
  {0, 1, 6, 4, 3},
  {0, 1, 2, 3, 6},
  {5, 6, 1, 2},
  {0, 5, 6, 2, 3},
  {0, 5, 4, 3, 2, 6},
  {0, 1, 2},
  {0, 1, 2, 3, 4, 5, 6},
  {6, 5, 0, 1, 2}
};

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800);
  // Load watermark
  watermark = loadImage("../watermark.png");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Turn off stroke
  noStroke();
  // Set fill to green
  fill(0, 255, 0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Start drawing at a point that makes the center of the block the center of the image
  translate(width/2 - 200, height/2 - 100);
  // Draw hour: top left
  drawNums(Character.getNumericValue(nf(hour(), 2).charAt(0)));
  translate(100, 0);
  drawNums(Character.getNumericValue(nf(hour(), 2).charAt(1)));
  translate(100, 0);
  // Draw minute: top right
  drawNums(Character.getNumericValue(nf(minute(), 2).charAt(0)));
  translate(100, 0);
  drawNums(Character.getNumericValue(nf(minute(), 2).charAt(1)));
  translate(-100, 200);
  // Draw second: bottom rgiht
  drawNums(Character.getNumericValue(nf(second(), 2).charAt(0)));
  translate(100, 0);
  drawNums(Character.getNumericValue(nf(second(), 2).charAt(1)));
  // Increment frame counter
  f++;
  if (f > 120){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}

// Method to draw number
void drawNums(int in){
  // Convert num into string
  String stringIn = String.valueOf(in);
  // For digit in string draw number
  for (int it=0;it<stringIn.length();it++){
    for (int l:letters[Character.getNumericValue(stringIn.charAt(it))]){
      // Iterate over positions and draw rectangles at specificed positions
      float[] loc = positions[l];
      rect(loc[0]*scale, loc[1]*scale, loc[2]*scale, loc[3]*scale);
    };
  }
}