PShape octahedron(int scale){
  PShape tmp = createShape();
  tmp.beginShape(TRIANGLES);
  
  // Top
  tmp.vertex(-scale, -scale);
  tmp.vertex(0, 0, scale);
  tmp.vertex(scale, -scale);
  tmp.vertex(-scale, -scale);

  tmp.vertex(scale, -scale);
  tmp.vertex(0, 0, scale);
  tmp.vertex(scale, scale);
  tmp.vertex(scale, -scale);
  
  tmp.vertex(scale, scale);
  tmp.vertex(0, 0, scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(scale, scale);
  
  tmp.vertex(-scale, scale);
  tmp.vertex(0, 0, scale);
  tmp.vertex(-scale, -scale);
  tmp.vertex(-scale, scale);
  
  // Bottom
  tmp.vertex(-scale, -scale);
  tmp.vertex(0, 0, -scale);
  tmp.vertex(scale, -scale);
  tmp.vertex(-scale, -scale);

  tmp.vertex(scale, -scale);
  tmp.vertex(0, 0, -scale);
  tmp.vertex(scale, scale);
  tmp.vertex(scale, -scale);
  
  tmp.vertex(scale, scale);
  tmp.vertex(0, 0, -scale);
  tmp.vertex(-scale, scale);
  tmp.vertex(scale, scale);
  
  tmp.vertex(-scale, scale);
  tmp.vertex(0, 0, -scale);
  tmp.vertex(-scale, -scale);
  tmp.vertex(-scale, scale);
  
  
  
  tmp.endShape();
  return tmp;
}