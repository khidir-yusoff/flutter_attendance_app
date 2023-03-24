import 'package:universal_platform/universal_platform.dart';

extension Target on Object {
  bool isAndroid() {
    return UniversalPlatform.isAndroid;
  }

  bool isIOS() {
    return UniversalPlatform.isIOS;
  }

  bool isLinux() {
    return UniversalPlatform.isLinux;
  }

  bool isWindows() {
    return UniversalPlatform.isWindows;
  }

  bool isMacOS() {
    return UniversalPlatform.isMacOS;
  }

  bool isWeb() {
    return UniversalPlatform.isWeb;
  }
}
