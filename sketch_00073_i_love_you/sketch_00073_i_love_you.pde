///-----------------------------------------------------------------
///   Name:           sketch_00073_i_love_you
///   Description:    I love you
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 19th, 2017
///   Notes:          I love you
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Set up scene
void setup()
{
  // Set size of image to 500px by 500px
  size(500, 500);
}

// Draw scene
void draw()
{
  // Draw black over background
  background(0);
  // Set fill to whtie
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("I love you", width/2, height/2);
  save("I_love_you.png");
  exit();
}