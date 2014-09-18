part of darn;

final Map<String, Producer<bool>> OS_DETECTIONS = {
  "Arch Linux": () => new File("/etc/arch-release").existsSync(),
  "Debian": () => new File("/etc/debian-release").existsSync(),
  "RedHat": () => new File("/etc/redhat-release").existsSync(),
  "Ubuntu": () {
    if (!Platform.isLinux) return false;
  
    var lsbRelease = new File("/etc/lsb-release");
    if (!lsbRelease.existsSync()) return false;
    if (!lsbRelease.readAsStringSync().toLowerCase().contains("ubuntu")) return false;
    return true;
  },
  "Fedora": () => new File("/etc/fedora-release").existsSync(),
  "CentOS": () => new File("/etc/centos-release").existsSync(),
  "Windows": () => Platform.isWindows,
  "Mac OSX": () => Platform.isMacOS,
  "Linux": () => Platform.isLinux
};

String _detectedOS;

bool isOperatingSystem(String name) => OS_DETECTIONS[name]();

String detectOperatingSystem() {
  if (_detectedOS == null) {
    _detectedOS = OS_DETECTIONS.keys.firstWhere((name) => OS_DETECTIONS[name](), orElse: () => "Unknown");
  }
  
  return _detectedOS;
}