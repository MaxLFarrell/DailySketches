///-----------------------------------------------------------------
///   Name:           sketch_00005_network_viewer
///   Description:    View network
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 12th, 2017
///   Notes:          n/a
///   ToDo:           Implement nmap parser and caller
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Dependencies for the ping function
import java.io.*;
import java.net.*;

// Host list
String[] hosts;

// Set up scene
void setup() {
  // Set hosts to check, first in list is assumed to be the router
  hosts = loadStrings("ips.txt");
  // Set size of the frame to 800px by 800px
  size(800, 800);
  // Make stroke white
  stroke(0);
  // Set stroke to thin
  strokeWeight(1);
  // Set background to black
  background(255);
  // Set fill to light grey
  fill(200);
}

// Check if server is up
// Code adapted from: http://www.rgagnon.com/javadetails/java-0093.html
boolean checkServer(String ip){
  try {
       // Create address object with  ip
       InetAddress address = InetAddress.getByName(ip);
       // Ping address and timeout in 500 milliseconds
       boolean canReach = address.isReachable(500);
       return canReach;
     }
     catch (UnknownHostException e) {
       System.err.println("Unable to lookup host: " + ip);
       return false;
     }
     catch (IOException e) {
       System.err.println("Unable to reach host: " + ip);
       return false;
     }
}

// Draw the scene
void draw() {
  // Calculation code adapted from: 
  // https://forum.processing.org/two/discussion/10104/drawing-x-number-of-lines-from-the-centre-of-a-circle-out-to-the-circumference
  // Tracks host we're on in the for loop, skips the router
  int it = 1;
  // Number of points to draw (besides the center)
  int points = hosts.length - 1;
  // Calculate the angle between points
  float pointAngle = 360/points;
  // Set distance from centerpoint
  int radius = 300;
  for (float angle = 270; angle < 630; angle = angle + pointAngle){
    // If server is up set color of node as green, if down: red
    if (checkServer(hosts[it]) == true){
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    // Calculate the x and y center for all following objects
    float x = (cos(radians(angle)) * radius) + 400; //convert angle to radians for x and y coordinates
    float y = (sin(radians(angle)) * radius) + 400;
    // Draw line to center
    line(x, y, width/2, height/2);
    // Draw point
    ellipse(x, y, 55, 55);
    // Set text size
    textSize(16);
    // Set text color to black
    fill(0);
    // Draw ip above host
    text(hosts[it], x-50, y-32);
    // Increment host tracker
    it++;
  }
  // If server is up set color of node as green, if down: red
  if (checkServer(hosts[0])){
    fill(0, 255, 0);
  } else {
    fill(255, 0, 0);
  }
  ellipse(width/2, height/2, 55, 55);
  // Set text size
  textSize(16);
  // Set text color to black
  fill(0);
  // Draw ip above host
  text(hosts[0], width/2-50, height/2+50);
  // Wait 1000 seconds then recheck hosts
  delay(1000);
  save("example.jpg");
}