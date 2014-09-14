part of darn;

class UpdateCommand extends Command {
  @override
  ArgParser get arguments =>
      new ArgParser();
  
  @override
  String get name => "update";
  
  @override
  void run(ArgResults args) {
    verifySystemTools();
    verifyDartSource();
    executeCommands([
      "@git cl rebase",
      "gclient sync -n",
      "gclient runhooks"
    ]);
  }
}