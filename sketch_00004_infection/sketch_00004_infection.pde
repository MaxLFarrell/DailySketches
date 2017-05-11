///-----------------------------------------------------------------
///   Name:           sketch_00004_infection
///   Description:    Simulates an infection
///   Author:         Max Farrell (max@mail.arcane.info)
///   Date:           May 11th, 2017
///   Notes:          n/a
///   Revision History:
///   Name:           Date:            Description:
///-----------------------------------------------------------------

// Tracker for if initial run has been done
boolean run = false;
// Create list for tracking locations
ArrayList<int[]> locations;
// Temporary storage for locations during a generation
ArrayList<int[]> tmpLocations;
// Genration counter
int gen = 0;

// Set up scene
void setup() {
  // Set size of flag to 1920px by 1080px
  size(500, 500);
  // Make stroke white
  stroke(255);
  // Set stroke to thin
  strokeWeight(1);
  // Set background to black
  background(0);
  // Set fill to white
  fill(255);
}

// Draw the scene
void draw() {
  if (!run){
    // Instantiate list to hold locations
    locations = new ArrayList<int[]>();
    for (int x=4;x<95;x++){
      for (int y=4;y<95;y++){
        // Decide if current location will start infected
        boolean infected = random(1) > .99;
        // Set point color to red if infected
        if (infected){
          stroke(255, 0, 0);
        }
        point(x * 5,y * 5);
        // Adds current location along with if it's infected or not
        locations.add(new int[]{x * 5, y * 5, (infected) ? 1 : 0});
        stroke(255);
      }
    }
    run = true; 
  }
  else {
    int it = 0;
    int[] offsets = new int[]{-1, -499, -90, -589};
    tmpLocations = locations;
    for (int[] location:locations){
      if (location[2] == 1){
        for (int offset: offsets){
          try {
            int[] tmpLocation = locations.get(it + offset);
            tmpLocation[2] = 1;
            tmpLocations.set(it + offset, tmpLocation);
            stroke(255, 0, 0);
            point(tmpLocation[0], tmpLocation[1]);
            stroke(0);
          } catch(IndexOutOfBoundsException e) {}
        }
      }
      it++;
     }
     locations = tmpLocations;
     gen++;
  }
  // Save image
  save("frame_" + nf(gen, 5) + ".jpg");
}