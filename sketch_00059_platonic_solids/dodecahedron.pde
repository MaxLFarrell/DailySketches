PShape dodecahedron(int scale){
  float gm = 1.618033;
  float o = 0.618033;
  PShape tmp = createShape();
  tmp.beginShape();
  
  for (int i=0; i<5 ; i++){
    float x = sin(TWO_PI/5*i) * scale; 
    float y = cos(TWO_PI/5*i) * scale;
    tmp.vertex(x, y);
  }
  tmp.vertex(0, scale);
  
  for (int i=0;i<5;i++){
    int next = i + 1;
    if (next > 4){
      next = 0;
    }
    PVector c = tmp.getVertex(i);
    PVector n = tmp.getVertex(next);
    tmp.vertex(c.x, c.y);
    tmp.vertex(n.x, n.y);
    tmp.vertex(c.x, c.y);
  }
  
  tmp.endShape();
  return tmp;
}