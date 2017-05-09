///-----------------------------------------------------------------
///   Name:           sketch_00001_smiley
///   Description:    Generates random flags
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 8th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///   Max Farrell     May 9th 2017     Added header comment
///   Max Farrell     May 9th 2017     Added "Name" to header comment
///-----------------------------------------------------------------

void setup() {
  size(400, 400);
  stroke(rc());
  strokeWeight(4);
  fill(rc());
  background(rc());
  noLoop();
} 
color rc(){
  return color(random(0, 255), random(0, 255), random(0, 255));
}
void draw() {
  float widthEye = random(25, 100);
  float heightEye = random(25, 100);
  ellipse(width/3, height/3, widthEye, heightEye);
  ellipse(width/3 * 2, height/3, widthEye, heightEye);
  noFill();
  arc(width/2, height/2, 100, 100, 0, PI);
  save(random(500000, 10000000) + ".jpg");
  exit();
}