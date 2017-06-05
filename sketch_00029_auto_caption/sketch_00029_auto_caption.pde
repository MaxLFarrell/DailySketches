///-----------------------------------------------------------------
///   Name:           sketch_00029_auto_caption
///   Description:    Generates a caption from an image and writes it
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           June 5th, 2017
///   Notes:          Requires unirest, api is based on: https://github.com/apple2373/chainer-caption
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Libraries required for api call
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import org.json.JSONArray;

// Image for watermark texture
PImage watermark;

// Image for captioning
PImage imageOb;

// Caption
String caption;

// Image file
String image = "markov.jpg"; 

// Set up scene
void setup() {
  // Load watermark
  watermark = loadImage("../watermark_black.png");
  // Set size of the frame to 800px by 800px
  size(800, 800);
  caption = captionGet(image);
  imageOb = loadImage(image);
  float ratio = imageOb.width/imageOb.height;
  imageOb.resize((int) (600 * ratio), 600);
}

// Draw the scene
void draw() {
   // Set background to white
  background(255);
  // Set fill to black
  fill(0);
  // Draw image
  image(imageOb, 0, 0);
  // Set text size for caption to 25
  textSize(25);
  // Draw caption underneath image
  text(caption, 10, 650);
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Save frame to filname + _captioned + extension
  String[] imname = new String[2];
  imname[0] = image.substring(0, image.indexOf("."));
  imname[1] = image.substring(image.indexOf("."), image.length());
  save("data/" + imname[0] + "_captioned" + imname[1]);
  // Exit program
  exit();
}

// Function for calling api with image
String captionGet(String fileName){
  HttpResponse<JsonNode> jsonResponse;
  String description = "";
  org.json.JSONArray ja;
  try {
    jsonResponse = Unirest.post("http://gpu.arc:8090/predict")
    .field("image", new File(dataPath("") + "/" + fileName))
    .asJson();
  } catch (UnirestException e){
    return e.toString();
  }
  try {
    ja = jsonResponse.getBody().getObject()
    .getJSONArray("captions")
    .getJSONObject(0)
    .getJSONArray("sentence");
    description = "";
    for (int it=1;it<ja.length()-1;it++){
      description += ja.get(it) + " ";
    }
  } catch(JSONException e){
    return e.toString();
  }
  return description;
}