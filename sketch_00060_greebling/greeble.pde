PShape[] greeble(PShape plane, int numgreebles){
  // Create and instantiate greeble array
  PShape[] greebles = new PShape[numgreebles];
  // Get x1, upper left
  float x1 = plane.getVertex(0).x;
  // Get x2, bottom right
  float x2 = plane.getVertex(2).x;
  // Get y1, upper left
  float y1 = plane.getVertex(0).y;
  // Get y2, bottom right
  float y2 = plane.getVertex(2).y;
  // Set maximum height of greebles, hard set at 50
  float maxheight = 50;
  // Calculate maxwidth, 5 times less than width
  float maxwidth = (x2 - x1)/5;
  // Calculate maxheight, 5 times less than height
  float maxlength = (y2 - y1)/5;
  // Decrement width and height for bottom right maximum in order to not have overflow greebles
  x2 -= maxwidth;
  y2 -= maxlength;
  // Generate numgreebles greebles
  for (int it=0;it<numgreebles;it++){
    PShape tmp = createShape();
    tmp.beginShape();
    float x = random(x1, x2);
    float y = random(y1, y2);
    float widthT = random(5, maxwidth);
    float lengthT = random(5, maxlength);
    float heightT = random(5, maxheight);
    
    tmp.vertex(x, y);
    tmp.vertex(x + widthT, y);
    tmp.vertex(x + widthT, y + lengthT);
    tmp.vertex(x, y + lengthT);
    tmp.vertex(x, y);
  
    tmp.vertex(x, y);
    tmp.vertex(x, y + lengthT);
    tmp.vertex(x, y + lengthT, heightT);
    tmp.vertex(x, y, heightT);
    tmp.vertex(x, y);
  
    tmp.vertex(x, y);
    tmp.vertex(x + widthT, y);
    tmp.vertex(x + widthT, y, heightT);
    tmp.vertex(x, y, heightT);
    tmp.vertex(x, y);
  
    tmp.vertex(x + widthT, y);
    tmp.vertex(x + widthT, y + lengthT);
    tmp.vertex(x + widthT, y + lengthT, heightT);
    tmp.vertex(x + widthT, y, heightT);
    tmp.vertex(x + widthT, y);
  
    tmp.vertex(x + widthT, y + lengthT);
    tmp.vertex(x, y + lengthT);
    tmp.vertex(x, y + lengthT, heightT);
    tmp.vertex(x + widthT, y + lengthT, heightT);
    tmp.vertex(x + widthT, y + lengthT);
  
    tmp.vertex(x + widthT, y + lengthT, heightT);
    tmp.vertex(x, y + lengthT, heightT);
    tmp.vertex(x, y, heightT);
    tmp.vertex(x + widthT, y, heightT);
    tmp.vertex(x + widthT, y + lengthT, heightT);
    tmp.endShape();
    greebles[it] = tmp;
  }
  return greebles;
}