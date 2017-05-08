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