///-----------------------------------------------------------------
///   Name:           sketch_00070_web_model_loader
///   Description:    Test loading models from url, models from here: http://people.sc.fsu.edu/~jburkardt/data/obj/obj.html
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 12th, 2017
///   Notes:          Models: http://people.sc.fsu.edu/~jburkardt/data/obj/obj.html
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// How to load pshape
PShape test;

// List of urls to pull obj to load from
String[] urls;

// Current obj url
String curUrl;

// Set up scene
void setup() {
  // Set size of image to 500px by 500px
  size(500, 500, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set upper right corner of frame to upper right corner of screen
  surface.setLocation(0, 0);
  // List of urls to pick from for obj to load
  urls = new String[]{
    "http://people.sc.fsu.edu/~jburkardt/data/obj/airboat.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/al.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/alfa147.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/cessna.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/diamond.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/dodecahedron.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/gourd.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/humanoid_quad.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/humanoid_tri.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/icosahedron.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/lamp.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/magnolia.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/minicooper.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/octahedron.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/power_lines.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/pyramid.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/roi.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/sandal.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/shuttle.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/skyscraper.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/slot_machine.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/symphysis.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/teapot.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/tetrahedron.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/trumpet.obj",
    "http://people.sc.fsu.edu/~jburkardt/data/obj/violin_case.obj"
  };
  curUrl = urls[(int) random(urls.length)];
  // Load random obj
  test = loadShape(curUrl);
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set origin to middle of frame
  translate(width/2, height/2);
  // Scale frame 75 times
  scale(10);
  // Rotate model to upright
  rotateX(PI);
  // Rotate 3 degrees per frame on Y axis
  rotateY(radians(frameCount*3));
  // Draw model
  shape(test);
  // Save image of rendered obj
  save("data/" + curUrl.split("/")[curUrl.split("/").length - 1] + ".png");
  // Exit program
  exit();
}