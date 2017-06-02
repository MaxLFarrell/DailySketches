///-----------------------------------------------------------------
///   Name:           sketch_00026_joker
///   Description:    Tells "jokes"
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 2nd, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Joker image
PImage joker;

// Image for watermark texture
PImage watermark;

// Joke
String joke;

// Set up scene
void setup() {
  // Load joker image
  joker = loadImage("https://cdn.pixabay.com/photo/2017/05/21/19/30/clown-2332044_640.png");
  // Load watermark
  watermark = loadImage("../watermark.png");
  // Set size of the frame to 800px by 800px
  size(800, 800);
  // Send post request to char rnn api
  PostRequest post = new PostRequest("http://gpu.arc:8080/api/v1.0");
  // Add header for json
  post.addHeader("Content-Type","application/json");
  // Add json to request
  post.addJson("{\"primetext\":\"a\", \"temperature\":\"0.8\", \"length\":\"140\", \"gpuid\":\"0\", \"model\":\"latest_jokes_cv.t7\",\"seed\":\"123\", \"sample\":\"1\" }");
  // Send request
  post.send();
  // Parse json object
  JSONObject json = parseJSONObject(post.getContent());
  // Set joke to response
  joke = json.getString("responds").split("--------------------------")[1];
}

// Draw the scene
void draw() {
   // Set background to white
  background(255);
  // Set fill to white
  fill(255);
  // Set stroke to black
  stroke(0);
  // Set stroke size to thing
  strokeWeight(2);
  // Draw the joker
  image(joker, 0, height/3, joker.width * 0.75, joker.height * 0.75);
  // Draw speech bubble
  triangle(280, 530, width * 0.75, height/4 + 75, width * 0.75, height/4 - 75);
  // Set stroke to black
  stroke(0);
  ellipse(width * 0.75, height/4, 400, 300);
  // Set stroke to white
  stroke(255);
  triangle(330, 475, width * 0.75, height/4 + 75, width * 0.75, height/4 - 67);
  // Set fill to black
  fill(0);
  // Set text size to 100
  textSize(18);
  // Draw text
  text(joke, 460, 100 , 300, 200);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Save frame to out.png
  save("out.png");
  // Exit program
  exit();
}