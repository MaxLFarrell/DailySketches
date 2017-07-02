///-----------------------------------------------------------------
///   Name:           sketch_00055_im2ascii
///   Description:    Convert images to 1 bit ascii art
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 1st, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Image to convert
PImage im;

// List of ascii characters
String alist = "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\\|()1{}[]?-_+~<>i!lI;:,`^`'. ";

// Image to convert
String imname = "test2.jpg";

// Text file to output to
String out = "out2.txt";

// How many factors to scale down
int scaleDown = 25;

// Set up scene
void setup() {
  // Set size of image to 1px by 1px
  size(1, 1);
  // Make sure we can resize the surface
  surface.setResizable(true);
  // Load image
  im = loadImage(imname);
  // Calculate aspect ratio for image rescale
  int ratio = im.width / im.height;
  // Rescale image
  im.resize(im.width/scaleDown, (im.height/scaleDown) * ratio);
  // Rescale surface
  surface.setSize(im.width, im.height);
}

// Draw the scene
void draw(){
  // Create list of strings to contain ascii art
  String[] ascii = new String[im.height];
  // Draw image on surface
  image(im, 0, 0);
  // Iterate through image pixels
  for (int y=0;y<im.height;y++){
    // Initialize ascii line
    ascii[y] = "";
    for (int x=0;x<im.width;x++){
      // Average of color values
      int av = 0;
      // Get color
      int col = get(x, y);
      // Calculate color average
      av = (int) ((red(col) + green(col) + blue(col))/3);
      // Make sure we don't go higher than the number of characters we have
      if (av > 250){
        av = 250;
      }
      // Round average to location of nearest character
      av = round(av/4) * 4;
      // Append character to line
      ascii[y] += alist.charAt(av / 4);
    }
    // Add line break to end of line
    ascii[y] += "\n";
  }
  // Save ascii art
  saveStrings(out, ascii);
  // Exit sketch
  exit();
}