///-----------------------------------------------------------------
///   Name:           sketch_00027_mondrian_gen
///   Description:    Generates a new mondrian painting
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 3rd, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// List for representation of image
ArrayList<column> paintArr;

// Set up scene
void setup() {
  // Load watermark
  watermark = loadImage("../watermark_black.png");
  // Set size of the frame to 800px by 800px
  size(800, 800);
  // Set stroke weight to slight
  strokeWeight(2);
  // Decide number of columns to make
  int numColumns = (int) random(3, 10);
  // Width tracker
  int widthRemaining = 800;
  // Instantiate list representation of image
  paintArr = new ArrayList<column>();
  // Create list representation of image
  for (int it=0;it<numColumns;it++){
    // Decide current width
    int curWidth = (int) random(0, widthRemaining);
    // If last row use remaining width
    if (it == numColumns - 1){
      // Add column
      paintArr.add(new column(widthRemaining));
    } else {
      // Add column
      paintArr.add(new column(curWidth));
    }
    // Subtract current width from width remaining
    widthRemaining -= curWidth;
  }
}

// Draw the scene
void draw() {
   // Set background to white
  background(255);
  // Set fill to white
  fill(255);
  int xoffset = 0;
  for (column c: paintArr){
    int yoffset = 0;
    for (int it=0;it<c.heights.length;it++){
      int y = c.heights[it];
      fill(c.colors[it]);
      rect(xoffset, yoffset, c.width, y);
      yoffset += y;
    }
    xoffset += c.width;
  }
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Save frame to out.png
  save("out_" + nf((int) random(0, 9999)) + ".png");
  // Exit program
  exit();
}

// Return a random color
color rc() {
  // Decide if white or color
  boolean isWhite = random(0, 1) > 0.75;
  if (isWhite == true){
    return color(255);
  } else {
    return color(random(0, 255), random(0, 255), random(0, 255));
  }
}

// Column class
public class column
{
  // Width int
  public int width;
  // Height array
  public int[] heights;
  // Color array
  public color[] colors;
  // Column instantiation
  public column(int obWidth){
    width = obWidth;
    // Height remaining tracker
    int heightRemaining = 800;
    // Decide number of rows
    int numRows = (int) random(3, 10);
    // Instantiate heights with new array with number of rows
    heights = new int[numRows];
    // Generate heights array
    for (int iit=0;iit<numRows;iit++){
      // Get current height, if at the last row set height to remaining height
      int curHeight = (int) random(0, heightRemaining);
      if (iit == numRows - 1){
        heights[iit] = heightRemaining;
      } else {
        heights[iit] = curHeight;
      }
      heightRemaining -= curHeight;
    }
    // Instantiate colors array
    colors = new int[heights.length];
    // Add random cplor to array
    for (int it=0;it<heights.length;it++){
      colors[it] = rc();
    }
  }
}