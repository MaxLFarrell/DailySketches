///-----------------------------------------------------------------
///   Name:           sketch_00076_random_gbc
///   Description:    Create 3d model of neural network generated GameBoy Color game
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 22th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import extruder library
import extruder.*;

// Image for watermark texture
PImage watermark;

// Cartridge
PShape[] cartridge;

// Image for label
PImage labelImage;

// Label pshape
PShape label;

// Extruder object
extruder e;

// Pixabay key
String key = "";

// Name of game
String game = "";

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(500, 500, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Instantiate extruder object
  e = new extruder(this);
  // Set fill to grey
  fill(220, 220, 220);
  // Extrude cartridge object
  cartridge = e.extrude(createShape(RECT, -125, -125, 250, 250), 20, "box");
  // List of games
  String[] games = loadStrings("gbc.txt");
  // Random choice of game
  game = games[(int) random(games.length)];
  // Request string
  String r = "https://pixabay.com/api/?key=" + key + "&q=" + game.split(" ")[0];
  // Result string
  String res = join(loadStrings(r), ' ');
  // Url of image
  String im = "";
  try {
    // Get image from json
    im = parseJSONObject(res).getJSONArray("hits").getJSONObject(0).getString("webformatURL");
  } catch (Exception e){
    // If there's no image results set image to white image
    im = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Solid_white_bordered.svg/600px-Solid_white_bordered.svg.png";
  }
  // Load image
  labelImage = loadImage(im);
  // Create label with label image
  label = createShape();
  // Start shape
  label.beginShape();
  label.texture(labelImage);
  label.vertex(-110, -70, 21, 0, 0);
  label.vertex(110, -70, 21, labelImage.width, 0);
  label.vertex(110, 110, 21, labelImage.width, labelImage.height);
  label.vertex(-110, 110, 21, 0, labelImage.height);
  label.vertex(-110, -70, 21, 0, 0);
  // End shape
  label.endShape();
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 110, height - 67, 100, 57);
  // Set center to center of image
  translate(width/2, height/2);
  // Draw cartridge
  for (PShape poly:cartridge){
    shape(poly);
  }
  // Draw label
  shape(label);
  // Set stroke to black
  stroke(0);
  // Increase z coordinate by 21 px
  translate(0, 0, 21);
  // Draw border for text
  rect(-110, -120, 220, 40);
  // Set fill to black
  fill(0);
  // Center align text
  textAlign(CENTER, CENTER);
  // Set text size to 20px
  textSize(20);
  // Draw Nontendo GAME GIRL text
  text("Nontendo GAME GIRL", 0, -100);
  // Set fill to color of the first pixel of the image inverted
  color c = labelImage.get(0, 0);
  if (red(c) == 0){
    fill(0, 0, 0);
  } else {
    fill(255-red(c), 255-green(c), 255-blue(c));
  }
  // Set text size to 10px
  textSize(10);
  // Left align text
  textAlign(LEFT, TOP);
  // Draw name of game on label
  text(game, -110, -70, 110, 110);
  // Save image of cartridge
  save("data/" + game.split(" ")[0] + ".png");
  // Exit program
  exit();
}