///-----------------------------------------------------------------
///   Name:           sketch_00019_midi_markov
///   Description:    Generate an unheard piece from input midis with markov chains
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 26th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

import eu.mihosoft.jcsg.*;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Set background to black
  background(0);
  // Set stroke to white
  stroke(200);
}

// Draw the scene
void draw(){
  CSG cube = new Cube(2).toCSG();
  // Draw black background
  background(0);
  fill(255);
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(0.25);
  box(100);
  lights();
  popMatrix();
  noLoop();
  // Exit program
  // exit();
}