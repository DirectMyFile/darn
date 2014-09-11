part of darn;

final List<Command> commands = [
  new BuildCommand()
];

void main(List<String> args) {
  var argp = new ArgParser(allowTrailingOptions: false);
  
  argp.addFlag("help", abbr: "h", help: "Prints this Help Message", defaultsTo: false, negatable: false);
  
  for (var cmd in commands) {
    var it = cmd.arguments;
    it.addFlag("help", abbr: "h", help: "Prints this Help Message", defaultsTo: false, negatable: false);
    argp.addCommand(cmd.name, it);
  }
  
  var opts = argp.parse(args);
  
  if (opts.command == null && opts.options.contains("help")) {
    print("Usage: darn <command> [args]");
    print(argp.getUsage());
    exit(0);
  }
  
  var cmd = commands.firstWhere((cmd) => cmd.name == opts.command.name);
  
  
  if (opts.command.options.contains("help")) {
    print("Usage: darn ${cmd.name} [args]");
    print(argp.commands[opts.command.name].getUsage());
    exit(0);
  }
  
  cmd.run(opts.command);
}