part of darn;

final List<Command> commands = [
  new BuildCommand()
];

void main(List<String> args) {
  var argp = new ArgParser(allowTrailingOptions: false);
  
  for (var cmd in commands) {
    argp.addCommand(cmd.name, cmd.arguments);
  }
  
  var opts = argp.parse(args);
  
  if (opts.command == null) {
    print("Usage: darn <command> [args]");
    print(argp.getUsage());
    exit(0);
  }
  
  var cmd = commands.firstWhere((cmd) => cmd.name == opts.command.name);
  
  cmd.run(opts.command);
}