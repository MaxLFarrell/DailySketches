PShape tetrahedron(int scale){
  PShape tmp = createShape();
  tmp.beginShape(TRIANGLES);
  
  tmp.vertex(0, -scale);
  tmp.vertex(scale, scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(0, -scale);
  
  tmp.vertex(0, -scale);
  tmp.vertex(0, 0, scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(0, -scale);
  
  tmp.vertex(0, -scale);
  tmp.vertex(0, 0, scale);
  tmp.vertex(scale, scale);
  tmp.vertex(0, -scale);
  
  tmp.vertex(0, 0, scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(scale, scale);
  tmp.vertex(0, 0, scale);
  
  tmp.endShape();
  return tmp;
}