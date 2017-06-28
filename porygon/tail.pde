PShape genTail(){
  PShape tmp;
  tmp = createShape();
  tmp.beginShape(QUADS);
  
  tmp.fill(0, 255, 255);
  tmp.stroke(0);
  
  tmp.vertex(-12.5, 0);
  tmp.vertex(12.5, 0);
  tmp.vertex(12.5, 0, 12.5);
  tmp.vertex(-12.5, 0, 12.5);
  tmp.vertex(-12.5, 0);
  
  tmp.vertex(-12.5, 100);
  tmp.vertex(-12.5, 100, 12.5);
  tmp.vertex(-12.5, 0, 12.5);
  tmp.vertex(12.5, 0, 12.5);
  tmp.vertex(12.5, 100, 12.5);
  tmp.vertex(-12.5, 100, 12.5);
  tmp.vertex(-12.5, 100, 0);
  tmp.vertex(12.5, 100, 0);
  tmp.vertex(-12.5, 100);
  
  tmp.endShape();
  return tmp;
}