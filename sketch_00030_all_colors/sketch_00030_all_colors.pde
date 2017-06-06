///-----------------------------------------------------------------
///   Name:           sketch_00030_all_colors
///   Description:    Draw all colors in rgb to picture
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 6th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// Frame counter
int f = 0;

// Color array
color[] curColor;

// Set up scene
void setup() {
  // Load watermark
  watermark = loadImage("../watermark_black.png");
  // Set size of the frame to 4073px by 4073px
  size(4073, 4073);
  // Instantiate color tracker
  curColor = new color[3];
}

// Draw the scene
void draw() {
  // X coordinate tracker
  int x = 0;
  // Y coordinate tracker
  int y = 0;
  // For each color in the 255, 255, 255 range draw a corresponding pixel
  for (int r=0;r<256;r++){
    for (int g=0;g<256;g++){
      for (int b=0;b<256;b++){
        // Construct color from r, g, and b values
        color c = color(r, g, b);
        // Set pixel
        set(x, y, c);
        // Increment x coordinate
        x++;
        // If x coordinate is greater than width reset to 0 and increment y coordinate
        if (x > width){
          x = 0;
          y += 1;
        }
      }
    }
  }
  // Draw watermark in bottom right corner
  image(watermark, width - 1000, height - 570, 1000, 570);
  // Save image
  save("out.png");
  // Exit program
  exit();
}