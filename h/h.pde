///-----------------------------------------------------------------
///   Name:           sketch_00069_ring_of_fire
///   Description:    Tiny ring of fire game
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 15th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

StringList deck;

// Set up scene
void setup() {
  // Set size of image to 500px by 500px
  size(500, 500);
  // Load watermark
  watermark = loadImage("../watermark.png");
  deck = new StringList();
  StringList suites = new StringList();
  suites.append("h");
  suites.append("d");
  suites.append("s"); 
  suites.append("c");
  for (String suite:suites){
    for (int it=0;it<11;it++){
      deck.append(suite + "," + it);
    }
    deck.append(suite + ",j");
    deck.append(suite + ",q");
    deck.append(suite + ",k");
  }
  deck.shuffle();
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set origin to center of image
  translate(width/2, height/2);
  if (frameCount == 0){
    print(deck.get(0));
  }
  /*
  // Exit sketch after 120th frame
  if (frameCount > 119){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(frameCount, 5) + ".png");
  */
}