// Draw and extrude the given points
void extrude(int[][] points, int depth, String edgeType){
  // Start shape
  beginShape();
  // Contains the next point
  int[] next = new int[0];
  // Contains the current point
  int[] cur;
  // Starting point in points array
  int start = 0;
  // If edge type is triangle start at index 1
  if (edgeType == "triangle"){
    start = 1;
  }
  // Iterate through points array
  for (int it = start;it<points.length;it++){
    // Set current point
    cur = new int[] {points[it][0], points[it][1]};
    // Set next point
    if (it == (points.length - 1)){
      if (edgeType == "triangle"){
        next = new int[] {points[1][0], points[1][1]};
      } else if (edgeType == "box"){
        next = new int[] {points[0][0], points[0][1]};
      }
    } else {
      next = new int[] {points[it+1][0], points[it+1][1]};
    }
    // Draw vertices for current point
    vertex(cur[0], cur[1], 0);
    if (edgeType == "box"){
      vertex(cur[0], cur[1], depth);
      vertex(next[0], next[1], depth);
    } else if (edgeType == "triangle"){
      vertex(points[0][0], points[0][1], depth);
    }
    vertex(next[0], next[1], 0);
    vertex(cur[0], cur[1], 0);
    
  }
  // Draw final point
  vertex(next[0], next[1], 0);
  if (edgeType == "box"){
      vertex(next[0], next[1], depth);
  } else if (edgeType == "triangle"){
    vertex(points[0][0], points[0][1], depth);
  }
  vertex(next[0], next[1], 0);
  // End shape
  endShape(CLOSE);
}

// Gather points from given pshape and then draw and extrude them
void extrude(PShape shape, int depth, String edgeType){
  // Initialize points tracker
  int[][] points = new int[shape.getVertexCount()][2];
  // For each vertex, add the x and y of the vertex to points
  for (int i = 0; i < shape.getVertexCount(); i++) {
    PVector v = shape.getVertex(i);
    points[i] = new int[]{(int) v.x, (int) v.y};
  }
  // Pass points, depth, and edgeType to direct extrude method
  extrude(points, depth, edgeType);
}