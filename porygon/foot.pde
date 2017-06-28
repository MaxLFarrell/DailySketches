PShape genFoot(){
  PShape tmp;
  tmp = createShape();
  tmp.beginShape(QUADS);
  tmp.fill(0, 255, 255);
  tmp.stroke(0);
  
  tmp.vertex(-12.5, 50);
  tmp.vertex(12.5, 50);
  tmp.vertex(12.5, 50, 10);
  tmp.vertex(-12.5, 50, 10);
  tmp.vertex(-12.5, 50);
  
  tmp.vertex(-12.5, -50);
  tmp.vertex(12.5, -50);
  tmp.vertex(12.5, 50);
  tmp.vertex(-12.5, 50);
  tmp.vertex(-12.5, -50);
  
  tmp.vertex(-12.5, -50, 10);
  tmp.vertex(-12.5, -10, 10);
  tmp.vertex(-12.5, -10);
  tmp.vertex(-12.5, -50);
  tmp.vertex(-12.5, -50, 10);
  
  
  tmp.endShape();
  return tmp;
}