///-----------------------------------------------------------------
///   Name:           sketch_00040_pos
///   Description:    Processing Operating System Concept
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 16th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import java io library
import java.io.*;

// List of lines
StringList lines;

// Current line index
int curline = 0;

// Current res of terminal output
String res = "";

// Current directory as a file object
File current;

// List of current files (this includes .. in order to easily move through directories)
StringList currentFiles;

// Frame tracker
int f = 0;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800);
  // Set text alignment to left align and top
  textAlign(LEFT, TOP);
  // Instantiate list of lines
  lines = new StringList("");
  // Change directory to current sketch directory
  cd(sketchPath(""));
}
// Draw scene
void draw(){
  // Draw black background
  background(0);
  // Set stroke to white
  stroke(255);
  // Set fill to white
  fill(255);
  // Set text size to 10px
  textSize(10);
  // Create temp string from last three lines in lines
  String tmp = "";
  if (lines.size() > 3){
    for (int it=0;it<3;it++){
      tmp += "> ";
      tmp += lines.get(lines.size() - 3 + it);
      tmp += "\n";
    }
  } else {
    tmp = "> ";
    tmp += lines.join("\n> ");
  }
  // Draw text "INPUT" to bottom left
  text("INPUT", 10, 620);
  // Draw input text
  text(tmp, 10, 650, 300, 400);
  // Draw text "OUTPUT" to bttom right
  text("OUTPUT", 420, 620);
  // Draw output text
  text(res, 420, 650, 300, 400);
  // Set fill to black
  fill(0);
  // Draw rectangle for back of file gui
  rect(0, 0, 800, 610);
  // Draw line between input and output windows
  line(400, 610, 400, height);
  // Draw current directory window
  rect(0, 750, width, 50);
  // Change fill to white
  fill(255);
  // Change text size to 12 px
  textSize(12);
  // Draw current directory location
  text(current.toString(), 10, 775);
  // Turn fill off
  noFill();
  // Start x and y trackers at 10px
  int x, y;
  x = y = 10;
  // Iterate through files and draw rectangle with file name under for each file
  for (String file : currentFiles){
    fill(0);
    rect(x, y, 80, 80);
    fill(255);
    textSize(10);
    text(file, x, y + 80, 80, 15);
    x += 100;
    if (x > 750){
      x = 10;
      y += 100;
    }
  }
  f++;
}