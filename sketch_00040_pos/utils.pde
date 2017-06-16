void cd(String path){
  current = new File(current, path);
  try {
    current = new File(current.getCanonicalPath());
  } catch (IOException e){
    res = e.toString();
  }
  currentFiles = new StringList();
  for (File f:current.listFiles()){
    currentFiles.append(f.getName());
  }
  currentFiles.append("..");
}

String directoryFromPosition(int[] loc){
  int x = 10;
  int y = 10;
  for (int it=0;it<currentFiles.size();it++){
      //System.out.println(file.getName());
      if ((loc[0] > x) && (loc[0] < x + 80)){
        if ((loc[1] > y) && (loc[1] < y + 80)){
          if ((new File(currentFiles.get(it))).isDirectory() != true){
            return currentFiles.get(it);
          } else if (currentFiles.get(it).equals("..")){
            return "..";
          }
        }
      }
      x += 100;
      if (x > 750){
        x = 10;
        y += 100;
      }
  }
  return "No directory";
}

String runcmd(String cmd) throws IOException {
  String res = "";
  ProcessBuilder builder = new ProcessBuilder(cmd.split(" "));
  builder.directory(current);
  builder.redirectErrorStream(true);
  Process p = builder.start();
  BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
  String line;
  while (true) {
    line = r.readLine();
    if (line == null) { break; }
    res += line + "\n";
  }
  return res;
}