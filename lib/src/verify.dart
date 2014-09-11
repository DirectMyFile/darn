part of darn;

void verifyDartSource() {
  var cwd = Directory.current;
  
  var buildPy = new File(cwd.path + Platform.pathSeparator + "tools/build.py");
  
  if (!buildPy.existsSync()) {
    print("ERROR: This is not a Dart Source Code directory.");
    exit(1);
  }
}