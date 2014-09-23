part of darn;

final List<String> POSSIBLE_ARCHS = ["all", "ia32", "x64", "simarm", "arm", "simmips", "mips", "simarm64", "arm64"];
final List<String> POSSIBLE_MODES = ["all", "release", "debug"];
final List<String> REQUIRED_TOOLS = [
  "git",
  "git-cl",
  "gclient",
  "python2 | python"
];