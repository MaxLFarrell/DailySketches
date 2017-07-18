///-----------------------------------------------------------------
///   Name:           sketch_00072_barcode_stories
///   Description:    Draw bar codes for each string in a given string list, barcode api here: http://www.barcodes4.me/apidocumentation
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 18th, 2017
///   Notes:          Barcode api: http://www.barcodes4.me/apidocumentation
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// List of words to 
String[] content = {"For", "sale", "shoes", "baby", "never", "worn"};

// Current bar code image
PImage curBarcode;

// If text below barcode should be drawn
boolean isTextDrawn = true;

// Extram parameters to send to barcode gen api
String eParams = "";

// Offset for loop DON'T TOUCH UNLESS YOU KNOW WHAT YOU'RE DOING
int indexOffset = 6;

// Set up scene
void setup() {
  // Set size of image to 500px by 500px
  size(500, 500, P3D);
  // Load watermark
  watermark = loadImage("../watermark_black.png");
  // Set upper right corner of frame to upper right corner of screen
  surface.setLocation(0, 0);
  // Set extra paremeter for drawing text below barcode
  if (isTextDrawn){
    eParams += "?IsTextDrawn=1";
  }
  // Load initial bar code image
  curBarcode = loadImage("http://www.barcodes4.me/barcode/c39/" + content[0] + ".jpg" + eParams);
}

// Draw the scene
void draw(){
  // Draw white background
  background(255);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Draw barcode in middle of frame
  image(curBarcode, 125, 200);
  // If on multiple of 120
  if ((frameCount % 120) == 0){
    // Save frame every time it's switched
    // save(nf(frameCount, 5) + ".png");
    // Increment loop offset
    if ((frameCount/120)/(indexOffset/content.length) >= content.length){
      indexOffset += content.length;
    }
    // Load new bar code
    curBarcode = loadImage("http://www.barcodes4.me/barcode/c39/" + content[(frameCount/120) - (indexOffset-content.length)] + ".jpg" + eParams);
  }
}