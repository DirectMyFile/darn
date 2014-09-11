part of darn;

abstract class Command {
  String get name;
  ArgParser get arguments;
  
  void run(ArgResults args);
}