part of darn;

void verifyDartSource() {
  if (!isDartSource()) {
    print("ERROR: This is not a Dart Source Code directory.");
    exit(1);
  }
}

bool isDartSource() {
  var cwd = Directory.current;
  var buildPy = new File(cwd.path + Platform.pathSeparator + "tools/build.py");
  return buildPy.existsSync();
}