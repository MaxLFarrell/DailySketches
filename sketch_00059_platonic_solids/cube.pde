PShape cube(int scale){
  PShape tmp = createShape();
  tmp.beginShape();
  
  tmp.vertex(-scale, -scale);
  tmp.vertex(scale, -scale);
  tmp.vertex(scale, scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(-scale, -scale);
  
  tmp.vertex(-scale, -scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(-scale, scale, scale);
  tmp.vertex(-scale, -scale, scale);
  tmp.vertex(-scale, -scale);
  
  tmp.vertex(-scale, -scale);
  tmp.vertex(scale, -scale);
  tmp.vertex(scale, -scale, scale);
  tmp.vertex(-scale, -scale, scale);
  tmp.vertex(-scale, -scale);
  
  tmp.vertex(scale, -scale);
  tmp.vertex(scale, scale);
  tmp.vertex(scale, scale, scale);
  tmp.vertex(scale, -scale, scale);
  tmp.vertex(scale, -scale);
  
  tmp.vertex(scale, scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(-scale, scale, scale);
  tmp.vertex(scale, scale, scale);
  tmp.vertex(scale, scale);
  
  tmp.vertex(scale, scale, scale);
  tmp.vertex(-scale, scale, scale);
  tmp.vertex(-scale, -scale, scale);
  tmp.vertex(scale, -scale, scale);
  tmp.vertex(scale, scale, scale);
  
  tmp.endShape();
  return tmp;
}