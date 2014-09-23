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

void verifySystemTools() {
  bool isWindows = Platform.isWindows;
  
  String PATH = Platform.environment['PATH'];
  
  List<String> SEARCH_PATHS = PATH.split(isWindows ? ";" : ":");
  
  bool findCommand(String name) {
    for (var SEARCH_PATH in SEARCH_PATHS) {
      var tryNames = [name, "${name}.exe", "${name}.bat", "${name}.cmd"];
      
      
      for (var NAME in tryNames) {
        var file = new File(path.join(SEARCH_PATH, NAME));
        
        if (file.existsSync()) {
          return true;   
        }
      }
    }
    
    return false;
  }
  
  for (var cmd in ["git", "git-cl", "gclient", "python"]) {
    if (!findCommand(cmd)) {
      print("ERROR: ${cmd} is required, but was not found.");
      exit(1);
    }
  }
}