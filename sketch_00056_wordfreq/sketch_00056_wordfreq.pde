///-----------------------------------------------------------------
///   Name:           sketch_00055_wordfreq
///   Description:    Get top n words in a document and draw a bar graph of them
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 2nd, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Import all necessary utilities
import java.util.*;

// Word list
String[][] wordList;

// Number of top frequency words to show
int n = 10;

// Name of file to run program on
String filename = "alice_in_wonderland.txt";

// Scale of height of bar graph
int scale = 50;

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800);
}

// Draw the scene
void draw(){
  // Load text document
  String doc = join(loadStrings(filename), "\n");
  // Clean up text for tokenization
  for (char c:new char[]{'.','?','!'}){
    doc = doc.replace(c, ' ');
  }
  // Replace any double spaces with single spaces
  doc = doc.replaceAll("[ ]{2,}", " ");
  // Instantiate wordlist
  wordList = new String[doc.split(" ").length][2];
  // Index of current new word
  int i=0;
  for (String word:doc.split(" ")){
    // If wordlist already contains word set to true
    boolean contains = false;
    for (int it=0;it<i;it++){
      try {
        // If word at current spot equals current word:
        // Increment frequency counter
        // Set contains tracker to true
        // Break out of for loop
        if (wordList[it][0].equals(word)){
          wordList[it][1] = Integer.toString(Integer.parseInt(wordList[it][1]) + 1);
          contains = true;
          break;
        }
      } catch (NullPointerException e){}
    }
    // If wordlist does not already contain word, append word with frequency of 1
    if (!contains){
      wordList[i] = new String[]{word, "1"};
      i++;
    }
  }
  // Crop word list to only non null spots
  String[][] croppedWordList = Arrays.copyOfRange(wordList, 0, i);
  // Sort cropped word list by frequency of words
  Arrays.sort(croppedWordList, new java.util.Comparator<String[]>() {
    public int compare(String[] a, String[] b) {
      Integer bInt = Integer.parseInt(b[1]);
      Integer aInt = Integer.parseInt(a[1]);
      return bInt.compareTo(aInt);
    }
  });
  // Set x offset
  int x = 10;
  // Set y offset
  int y = 600;
  // Set width of bars
  int widthB = 780 / n;
  // Iterate through word list, for the given number of top words to iterate through
  for (int it=0;it<n;it++){
    // Set fill to white
    fill(255);
    // Get current word
    String word = croppedWordList[it][0];
    // Calculate current height from frequency
    int heightB = Integer.parseInt(croppedWordList[it][1])/scale;
    // Draw bar
    rect(x + (it * widthB), y - heightB, widthB, heightB);
    textAlign(CENTER, BOTTOM);
    // Set text size to 3 times less than bar width
    textSize(widthB/3);
    // Set text fill to black
    fill(0);
    // Draw word at top of bar
    text(word, x + (it * widthB) + (widthB/2), y - heightB);
    textAlign(CENTER, TOP);
    // Draw frequency at bottom of bar
    text(heightB * scale, x + (it * widthB) + (widthB/2), 600);
  }
  textAlign(CENTER, CENTER);
  text(filename, width/2, 700);
  // Draw filename at bottom of bar
  save(filename + ".png");
  // Exit sketch
  exit();
}