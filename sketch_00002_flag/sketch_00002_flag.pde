///-----------------------------------------------------------------
///   Name:           sketch_00002_flag
///   Description:    Generates random flags
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 9th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Set up scene
void setup() {
  // Set size of flag to 500px by 300px
  size(500, 300);
  // Set fill color to a random color
  fill(rc());
  // Set background color to a random color
  background(rc());
  // Turn off stroke
  noStroke();
  // Turn off looping
  noLoop();
} 

// Return a random color
color rc() {
  return color(random(0, 255), random(0, 255), random(0, 255));
}

// Star drawing function from documentation
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

// Draw the scene
void draw() {
  // Choose the number of stripes the flag will have
  int stripes = (int) random(1, 4);
  if (stripes != 1) {
    // Calculate the individual height of the stripes
    int heightStripe = height / stripes;
    // Initialize the offset of the stripes
    int offset = heightStripe;
    while (stripes != 1) {
      // Draw stripe with upper left corner against the left side
      // and ending on the right side with the height of heighStripe
      rect(0, offset, 500, heightStripe);
      // Reset fill to random color
      fill(rc());
      offset += heightStripe;
      stripes -= 1;
    }
    // Choose whether to add a new object
    boolean addObject = random(1) > .5;
    if (addObject == true) {
      fill(rc());
      // Choose whether to add a circle or a star
      boolean circle = random(1) > .5;
      if (circle == true){
        // Choose random size for circle between 25 and 100 px
        float size = random(25, 100);
        // Draw circle at random x and y coordinates
        ellipse((int) (random(width)), (int) (random(height)), size, size);
      } else {
        // Choose random number of points for star
        int points = (int) (random(3, 7));
        // Draw start at random x and y coordinates
        star((int) (random(width)), (int) (random(height)), 30, 70, points);
      }
    }
  }
  // Save image
  save(random(500000, 10000000) + ".jpg");
  // Exit program
  exit();
}