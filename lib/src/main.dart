part of darn;

final List<Command> commands = [
  new BuildCommand(),
  new FetchCommand(),
  new UpdateCommand()
];

void main(List<String> args) {
  var argp = new ArgParser(allowTrailingOptions: false);
  
  argp.addFlag("help", abbr: "h", help: "Prints this Help Message", negatable: false, defaultsTo: false);
  argp.addFlag("commands", help: "Lists Commands and their Options", negatable: false, defaultsTo: false);
  
  for (var cmd in commands) {
    var it = cmd.arguments;
    argp.addCommand(cmd.name, it);
  }
  
  var opts = argp.parse(args);
  
  if (opts['commands']) {
    print("Darn Commands:");
    for (var cmd in commands) {
      print("  - ${cmd.name}");
      
      var usage = argp.commands[cmd.name].getUsage();
      
      if (usage.trim().replaceAll("\n", "").isEmpty) {
        continue;
      }
      
      for (var line in usage.split("\n")) {
        print("    ${line}");
      }
    }
    
    exit(0);
  }
  
  if (opts.command == null || opts['help']) {
    print("Usage: darn <command> [args]");
    print(argp.getUsage());
    exit(0);
  }
  
  var cmd = commands.firstWhere((cmd) => cmd.name == opts.command.name);
  
  cmd.run(opts.command);
}