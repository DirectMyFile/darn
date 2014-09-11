part of darn;

class UpdateCommand extends Command {
  @override
  ArgParser get arguments =>
      new ArgParser();
  
  @override
  String get name => "update";
  
  @override
  void run(ArgResults args) {
    executeCommands([
      "gclient sync -n",
      "gclient runhooks"
    ]);
  }
}