part of darn;

class BuildCommand extends Command {
  @override
  ArgParser get arguments =>
    new ArgParser()
      ..addFlag("verbose", defaultsTo: false, negatable: false, help: "Enables Verbose Output")
      ..addOption("arch", abbr: "a", allowed: POSSIBLE_ARCHS, allowMultiple: false, defaultsTo: "ia32")
      ..addOption("mode", abbr: "m", allowed: POSSIBLE_MODES, allowMultiple: false, defaultsTo: "release");
  
  @override
  String get name => "build";
  
  @override
  void run(ArgResults args) {
    
    String arch = args['arch'];
    
    String mode = args['mode'];
    
    var targets = args.rest.isNotEmpty ? args.rest : ["create_sdk"];
    
    verifyDartSource();
    
    var commands = [];
    
    var cmd = "python2 tools/build.py -m ${mode} -a ${arch} ${targets.join(" ")}";
    
    commands.add(cmd);
    
    executeCommands(commands);
  }
}