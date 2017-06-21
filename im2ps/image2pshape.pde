PShape image2pshape(String imagename, int linecolor){
  PShape res = createShape();
  PImage image = loadImage(imagename);
  res.beginShape();
  for (int x=0;x<image.width;x++){
    for (int y=0;y<image.height;y++){
      if (image.get(x, y) == -16777216){
        res.vertex(x, y);
      }
    }
  }
  //res.vertex((int) res.getVertex(0).x, (int) res.getVertex(0).y);
  res.endShape();
  return res;
}