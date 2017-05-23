///-----------------------------------------------------------------
///   Name:           sketch_000016_midi_image
///   Description:    Converts image into a midi file
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 23th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import soundcipher library for writing midi
import arb.soundcipher.*;

// Original image
PImage orig;

// Image of edges
PImage changed;

// Set up scene
void setup() {
  // Set size of image to 200px by 200px
  size(200, 200);
  
  // Load origin image
  orig= loadImage("image.jpg");
  
  // Reset size of image to size of origin image
  frame.setSize(orig.width, orig.height);
  
  // Create edge detector object
  CannyEdgeDetector detector = new CannyEdgeDetector();

  // Set low threshold and high threshold very high in order to get only the main edges
  detector.setLowThreshold(11.5f);
  detector.setHighThreshold(12f);
  
  // Set source image to process to origin image
  detector.setSourceImage((java.awt.image.BufferedImage)orig.getImage());
  
  // Process image
  detector.process();
  
  // Create image from edges
  BufferedImage edges = detector.getEdgesImage();
  
  // Set changed image to edges
  changed = new PImage(edges);
  
  // Do not loop
  noLoop();
}

// Draw scene
void draw() 
{
  // Draw edges (this does not work) but is necessary to save image
  image(changed, 0,0, width, height);
  
  // Save image
  saveFrame("edges.jpg");
  
  // Create score to store midi notes
  SCScore score = new SCScore();

  // For each x and y coordinate of the image check if pixel is white, if it is:
  // create not corresponding to that point
  for(float y=0; y< height; y++) {
    for(float x=0;x< width; x++){
      if (get((int) x,(int) y) == color(255)){
        score.addNote(x+0.5, 100-(y/(height/100)), 100, 0.5);
      }
    }
  }
  
  // Save midi file to current location
  score.writeMidiFile(sketchPath("") + "/out.mid");
  
  // Kill program
  exit();
}