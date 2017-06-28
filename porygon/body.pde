PShape genBody(){
  PShape tmp;
  tmp = createShape();
  tmp.beginShape(QUADS);
  
  tmp.fill(0, 255, 255);
  tmp.stroke(0);
  
  tmp.vertex(-50, 50);
  tmp.vertex(50, 50);
  tmp.vertex(50, 50, 25);
  tmp.vertex(-50, 50, 25);
  tmp.vertex(-50, 50);
  
  tmp.vertex(-50, -50);
  tmp.vertex(-50, -50, 25);
  tmp.vertex(-50, 50, 25);
  tmp.vertex(-50, 50);
  tmp.vertex(-50, -50);
  
  tmp.vertex(50, -50);
  tmp.vertex(50, -50, 25);
  tmp.vertex(-50, -50, 25);
  tmp.vertex(-50, -50);
  tmp.vertex(50, -50);
  
  tmp.vertex(50, 50);
  tmp.vertex(50, 50, 25);
  tmp.vertex(50, -50, 25);
  tmp.vertex(50, -50);
  tmp.vertex(50, 50);
  
  tmp.vertex(-50, 50);
  tmp.vertex(-50, -50);
  tmp.vertex(50, -50);
  tmp.vertex(50, 50);
  tmp.vertex(-50, 50);
  
  tmp.vertex(-50, 50, 25);
  tmp.vertex(-50, -50, 25);
  tmp.vertex(50, -50, 25);
  tmp.vertex(50, 50, 25);
  tmp.vertex(-50, 50, 25);
  
  tmp.vertex(0, 0, 50);
  tmp.vertex(-50, -50, 25);
  tmp.vertex(-50, 50, 25);
  tmp.vertex(0, 0, 50);
  
  tmp.vertex(0, 0, 50);
  tmp.vertex(-50, 50, 25);
  tmp.vertex(50, 50, 25);
  tmp.vertex(0, 0, 50);
  
  tmp.vertex(0, 0, 50);
  tmp.vertex(50, 50, 25);
  tmp.vertex(50, -50, 25);
  tmp.vertex(0, 0, 50);
  
  tmp.vertex(0, 0, 50);
  tmp.vertex(50, -50, 25);
  tmp.vertex(-50, -50, 25);
  tmp.vertex(0, 0, 50);
  
  tmp.endShape();
  return tmp;
}