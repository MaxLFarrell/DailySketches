///-----------------------------------------------------------------
///   Name:           sketch_00052_texture_swapping
///   Description:    Test efficiency of hard texture swapping, model extracted by Alec Pike (https://www.models-resource.com/submitter/alecpike/)
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 27th, 2017
///   Notes:          Yoshi model found here: https://www.models-resource.com/nintendo_64/supermario64/model/1709/
///                   Alec Pike
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

import static java.nio.file.StandardCopyOption.*;
import java.nio.*;
import java.nio.file.Path;
import java.nio.file.Files;

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// 3d model
PShape test;

// Set up scene
void setup() {
  // Set size of image to 600px by 600px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Set center to center of image
  translate(width/2, height/2, 0);
  // Rotate yoshi to be standing up right
  rotateX(PI);
  // Rotate 3 degrees per frame
  rotateY(PI + radians(f*3));
  
  // Load yoshi
  test = loadShape("yoshi.obj");
  
  // Scale yoshi to be highly visible
  scale(100);
  // Draw yoshi
  shape(test);
  
  // At frame 40 hard switch to black texture
  if ((f > 39) && (f < 41)){
    try {
      Files.copy(new File(dataPath("") + "/modified/black.yoshi_grp.png").toPath(), new File(dataPath("") + "/yoshi_grp.png").toPath(), REPLACE_EXISTING);
    } catch (IOException e){
      e.printStackTrace();
      while(true){}
    }
  } else if ((f > 79) && (f < 81)){ // At frame 80 hard switch to blue texture
    try {
      Files.copy(new File(dataPath("") + "/modified/blue.yoshi_grp.png").toPath(), new File(dataPath("") + "/yoshi_grp.png").toPath(), REPLACE_EXISTING);
    } catch (IOException e){
      e.printStackTrace();
      while(true){}
    }
  }  else if ((f > 119) && (f < 121)){ // At frame 120 hard switch to green (original texture)
    try {
      Files.copy(new File(dataPath("") + "/modified/green.yoshi_grp.png").toPath(), new File(dataPath("") + "/yoshi_grp.png").toPath(), REPLACE_EXISTING);
    } catch (IOException e){
      e.printStackTrace();
      while(true){}
    }
  }
  
  // Increment frame
  f++;
  if (f > 121){
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".png");
}