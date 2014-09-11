part of darn;

Future executeCommands(List<String> commands) {
  var future = new Future.value();

  for (var command in commands) {
    var split = command.split(" ");
    var executable = split.removeAt(0);


    future = future.then((value) {
      return Process.start(executable, split).then((process) {
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
  
  return future;
}
