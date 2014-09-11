part of darn;

Future executeCommands(List<String> commands) {
  var queue = new TaskQueue();
  var completer = new Completer();
  for (var command in commands) {
    var split = command.split(" ");
    var executable = split.removeAt(0);
    
    
    queue.add(() {
      Process.start(executable, split).then((process) {
        inheritIO(process);
        
        return process.exitCode;
      }).then((exitCode) {
        if (exitCode != 0) {
          print("Command '${command}' exited with exit code ${exitCode}");
          exit(1);
        }
      });
    });
  }
  
  queue.add(() {
    completer.complete();
  });
  
  queue.run();
  
  return completer.future;
}