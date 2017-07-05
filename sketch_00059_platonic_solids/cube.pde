PShape cube(int scale){
  PShape tmp = createShape();
  tmp.beginShape();
  
  tmp.vertex(-scale/2, -scale/2);
  tmp.vertex(scale/2, -scale/2);
  tmp.vertex(scale/2, scale/2);
  tmp.vertex(-scale/2, scale/2);
  tmp.vertex(-scale/2, -scale/2);
  
  tmp.vertex(-scale/2, -scale/2);
  tmp.vertex(-scale/2, scale/2);
  tmp.vertex(-scale/2, scale/2, scale);
  tmp.vertex(-scale/2, -scale/2, scale);
  tmp.vertex(-scale/2, -scale/2);
  
  tmp.vertex(-scale/2, -scale/2);
  tmp.vertex(scale/2, -scale/2);
  tmp.vertex(scale/2, -scale/2, scale);
  tmp.vertex(-scale/2, -scale/2, scale);
  tmp.vertex(-scale/2, -scale/2);
  
  tmp.vertex(scale/2, -scale/2);
  tmp.vertex(scale/2, scale/2);
  tmp.vertex(scale/2, scale/2, scale);
  tmp.vertex(scale/2, -scale/2, scale);
  tmp.vertex(scale/2, -scale/2);
  
  tmp.vertex(scale/2, scale/2);
  tmp.vertex(-scale/2, scale/2);
  tmp.vertex(-scale/2, scale/2, scale);
  tmp.vertex(scale/2, scale/2, scale);
  tmp.vertex(scale/2, scale/2);
  
  tmp.vertex(scale/2, scale/2, scale);
  tmp.vertex(-scale/2, scale/2, scale);
  tmp.vertex(-scale/2, -scale/2, scale);
  tmp.vertex(scale/2, -scale/2, scale);
  tmp.vertex(scale/2, scale/2, scale);
  
  tmp.endShape();
  return tmp;
}