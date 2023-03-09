import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'b0pass_mobile_plugin_method_channel.dart';

abstract class B0passMobilePluginPlatform extends PlatformInterface {
  /// Constructs a B0passMobilePluginPlatform.
  B0passMobilePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static B0passMobilePluginPlatform _instance = MethodChannelB0passMobilePlugin();

  /// The default instance of [B0passMobilePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelB0passMobilePlugin].
  static B0passMobilePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [B0passMobilePluginPlatform] when
  /// they register themselves.
  static set instance(B0passMobilePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> run() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> stop() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
