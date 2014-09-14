part of darn;

class FetchCommand extends Command {
  @override
  ArgParser get arguments =>
      new ArgParser();
  
  @override
  String get name => "fetch";
  
  @override
  void run(ArgResults args) {
    verifySystemTools();
    if (isDartSource()) {
      getCommand("update").execute([]);
    } else {
      executeCommands([
        "gclient config https://dart.googlecode.com/svn/branches/bleeding_edge/deps/all.deps",
        "git svn clone -rHEAD https://dart.googlecode.com/svn/branches/bleeding_edge/dart dart",
        "gclient sync -n",
        "gclient runhooks"
      ]);
    }
  }
}
