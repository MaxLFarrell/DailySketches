void mousePressed(){
  if (mouseButton == LEFT){
    int[] loc = new int[]{mouseX, mouseY};
    String tmpdir = directoryFromPosition(loc);
    if (tmpdir.equals("No directory") != true){
      cd(tmpdir);
    }
  }
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (lines.get(curline).length() > 0) {
      lines.set(curline, lines.get(curline).substring(0, lines.get(curline).length()-1));
    }
  } else if (keyCode == DELETE) {
    lines.set(curline, "");
  } else if (keyCode == ENTER){
    lines.append("");
    if (lines.get(curline).equals("clear")){
      res = "";
    } else if (lines.get(curline).substring(0, 2).equals("cd")){
      cd(lines.get(curline).split(" ")[1]);
  } else {
      try {
        res = runcmd(lines.get(curline));
      } catch (IOException e){
        res = e.toString();
      }
    }
    curline++;
  } else if (keyCode == CONTROL){
    save("frame_" + nf(f, 5) + ".jpg");
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    lines.set(curline, lines.get(curline) + key);
  }
}