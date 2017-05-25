///-----------------------------------------------------------------
///   Name:           sketch_00017_basic_aesthetic
///   Description:    Generate some text from the communist manifesto and overlay
///                   it on a generated background color
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 24th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import text parsing and generation library
import rita.*;

// Create markov object for text
RiMarkov markov;

// Create markov object for color
RiMarkov markovc;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(600, 600);
  // Set text size to 20
  textSize(20);
  // Turn off stroke
  noStroke();
  // Load communist manifesto into string array
  String[] commManifest = loadStrings("61.txt");
  // Instantiate markov object to 4 n grams
  markov = new RiMarkov(4);
  // Load text into markov object
  markov.loadText(join(commManifest, " "));
  // Load hex colors into string array
  String[] colors = loadStrings("pastels.txt");
  // Instantiate markov object to 4 n grams
  markovc = new RiMarkov(4);
  // Load hex colors into markov object
  markovc.loadText(join(colors, " "));
}

// Draw the scene
void draw(){
  // Generate a random sentence
  String tmptxt = markov.generateSentences(1)[0];
  // Generate a random color
  String tmpcolor = markovc.generateTokens(1)[0].split(" ")[0];
  // Parse color from generated string
  color c = Integer.parseInt(tmpcolor, 16);
  // Make color background color
  background(c);
  // Make color mixed 70% with black text color
  fill(lerpColor(c, #000000, 0.7));
  // Draw text
  text(tmptxt, width/2 - 150, height/2 - 100, width/2, height/2);
  save(nf((int) random(0, 9999999), 5) + ".jpg");
  exit();
}