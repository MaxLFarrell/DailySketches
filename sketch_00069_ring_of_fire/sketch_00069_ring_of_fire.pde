///-----------------------------------------------------------------
///   Name:           sketch_00069_ring_of_fire
///   Description:    Tiny ring of fire game, try it out for yourself here: https://www.openprocessing.org/sketch/439853
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 15th, 2017
///   Notes:          Sketch here: https://www.openprocessing.org/sketch/439853
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Image for watermark texture
PImage watermark;

// Deck of cards
ArrayList<String> deck;

// Current card
String curCard;

// List of rules
String[] rules;

// Current rule
String curRule;

// Set up scene
void setup() {
  // Set size of image to 500px by 500px
  size(500, 500);
  // Instantiate list of rules
  rules = new String[]{
    "Ace,Waterfall – Everyone must keep drinking until \nthe person who picked the card stops.",
    "2,Choose – Choose someone to drink",
    "3,Me – You must drink",
    "4,Dudes – All guys drink",
    "5,Nose - Last person to touch their nose drinks",
    "6,Chicks - All girls drink",
    "7,Heaven – Point your finger in the sky; \nwhoever is last must drink",
    "8,Mate – Choose someone to drink with you",
    "9,Rhyme – Pick a word; go in a circle rhyming it; \nthe first person to mess up drinks",
    "10,Categories - Pick a category; go in a circle saying \nthings in that category; the first person to mess up drinks",
    "Jack,Make a Rule - Make up a rule for the game and \nwhoever messes it up (including you) drinks",
    "Queen,Jeans - Anyone who's wearing jeans drinks",
    "King,Pour - Pour a little of your drink into the cup in the center"
  };
  // Generate deck for round
  genDeck();
  // Instantiate current card string
  curCard = "";
  // Instantiate current rule string
  curRule = "";
}

// Draw the scene
void draw(){
  // Draw black background
  background(0);
  // Set origin to center of image
  translate(width/2, height/2);
  // Set fill to white
  fill(255);
  // Draw "draw" button
  rect(-50, 100, 100, 25);
  // Set text size to 12px
  textSize(12);
  // Set fill to back
  fill(0);
  // Align text to center height and width wise on draw point
  textAlign(CENTER, CENTER);
  // Draw "draw" button text
  text("Draw", 0, 112);
  // Set fill to white
  fill(255);
  // Draw current rule
  text(curRule, 0, -150);
  // Set text size to 20px
  textSize(20);
  // Draw number of cards left
  text(deck.size() + " cards left", 0, -100);
  // Draw current card
  text(curCard, 0, 0);
}

// On mouse button click
void mouseClicked(){
  if ((mouseX > 200) && (mouseX < 300)){ // If mouseX inside button
    if ((mouseY > 350) && (mouseY < 400)){ // If mouseY inside button as well as mouseX
      if (deck.size() == 0){ // If no cards left in deck re-gen deck
        genDeck();
      }
      // Get next card
      String card = deck.get(0);
      // Remove next card from deck
      deck.remove(0);
      // Get suite of card
      String suite = card.split(",")[0];
      // Get value of card
      String val = card.split(",")[1];
      // Check which symbol to substitute for suite
      if (suite.equals("h")){
        suite = "♥";
      } else if (suite.equals("d")){
        suite = "♦";
      } else if (suite.equals("s")){
        suite = "♠";
      } else if (suite.equals("c")){
        suite = "♣";
      }
      // Get and set current rule
      curRule = getRule(val);
      // Set current card
      curCard = val + " of " + suite;
    }
  }
}

// Method to generate deck of cards
void genDeck(){
  // Instantiate new deck
  deck = new ArrayList<String>();
  // Make list of suites
  String[] suites = new String[]{"h", "d", "s", "c"};
  // For each suite generate 2-10, Jack, Queen, King, and Ace and add them to the deck
  for (String suite:suites){
    for (int it=2;it<11;it++){
      deck.add(suite + "," + it);
    }
    deck.add(suite + ",Jack");
    deck.add(suite + ",Queen");
    deck.add(suite + ",King");
    deck.add(suite + ",Ace");
  }
  // Temporary deck to iterate through
  ArrayList<String> tmpDeck = deck;
  // List of places in deck already taken
  ArrayList<Integer> placesTaken = new ArrayList<Integer>();
  // For card in tmpDeck choose a random untaken spot in deck and place the card there
  for (String card:tmpDeck){
    int place = (int) random(tmpDeck.size());
    while (placesTaken.contains(place)){
      place = (int) random(tmpDeck.size());
    }
    placesTaken.add(place);
    deck.set(place, card);
  }
}

// Method to get rule based on value
String getRule(String val){
  // For each rule check if the value of the input matches the value of the rules, if it does return it
  for (String rule:rules){
    if (rule.split(",")[0].equals(val)){
      return rule.split(",")[1];
    }
  }
  return "nope";
}