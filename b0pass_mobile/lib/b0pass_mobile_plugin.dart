
import 'b0pass_mobile_plugin_platform_interface.dart';

class B0passMobilePlugin {
  Future<String?> getPlatformVersion() {
    return B0passMobilePluginPlatform.instance.getPlatformVersion();
  }

  // Future<String?> getSayHi(String text) {
  //   return GomobileDemoPlatform.instance.getSayHi(text);
  // }

  Future<String?> run() {
    return B0passMobilePluginPlatform.instance.run();
  }

  Future<String?> stop() {
    return B0passMobilePluginPlatform.instance.stop();
  }
}
