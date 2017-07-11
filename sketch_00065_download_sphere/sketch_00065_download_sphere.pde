///-----------------------------------------------------------------
///   Name:           sketch_00065_download_sphere
///   Description:    Measure download speed
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           July 11th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Frame tracker
int f = 0;

// Image for watermark texture
PImage watermark;

// Download thread
Thread t;

// See if download is done
boolean done = false;

// Time it took to download
float downloadT = 0;

// Speed
float speed = 0;

// File bytes
byte[] b = new byte[1];

// Set up scene
void setup() {
  // Set size of image to 800px by 800px
  size(800, 800, P3D);
  // Load watermark
  watermark = loadImage("../watermark.png");
}

// Draw the scene
void draw(){
  // On first frame start download
  if (f == 0){
    startDL();
  }
  // Draw black background
  background(0);
  // Turn off stroke
  noStroke();
  // Draw watermark in bottom right corner
  image(watermark, width - 210, height - 124, 200, 114);
  // Start drawing at a point that makes the center of the block the center of the image
  translate(width/2, height/2 - 100);
  if (done){ // Set fill to green
    fill(0, 255, 0);
  } else { // Set fill to red
    fill(255, 0, 0);
  }
  // Draw 100px sphere
  sphere(100);
  // Move to center of image
  translate(0, + 120);
  // Set text size to 20px
  textSize(20);
  // Center align text
  textAlign(CENTER, CENTER);
  if (done){ // Show speed
    text(speed + " mb/s", 0, 0);
  } else { // Show "Downloading"
    text("Downloading", 0, 0);
  }
  // Increment frame counter
  f++;
  if (done){ // Exit program
    exit();
  }
  // Save frame
  save("data/frame_" + nf(f, 5) + ".jpg");
}

// Download thread starter
void startDL(){
  // Download thred
  t = new Thread(new Runnable() {
    public void run() {
      // Get start time
      int start = millis();
      // Download the file
      b = loadBytes("http://speedtest-ny.turnkeyinternet.net/100mb.bin");
      // Calculate how long it took to download the file
      downloadT = (millis() - start)/1000;
      // Cacluate megabytes per second
      speed = downloadT/20;
      // Set done to true
      done = true;
    }
  });
  // Start thread
  t.start();
}