import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'b0pass_mobile_plugin_platform_interface.dart';

/// An implementation of [B0passMobilePluginPlatform] that uses method channels.
class MethodChannelB0passMobilePlugin extends B0passMobilePluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('b0pass_mobile_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> run() async {
    // final sayHi = await methodChannel.invokeMethod<String>(
    //   'getSayHi',
    //   {"text": text},
    // );

    final rs = await methodChannel.invokeMethod<String>(
      'run',
    );
    return rs;
  }

  @override
  Future<String?> stop() async {
    final rs = await methodChannel.invokeMethod<String>(
      'stop',
    );
    return rs;
  }
}
