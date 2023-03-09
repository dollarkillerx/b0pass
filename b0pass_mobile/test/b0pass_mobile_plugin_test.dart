import 'package:flutter_test/flutter_test.dart';
import 'package:b0pass_mobile_plugin/b0pass_mobile_plugin.dart';
import 'package:b0pass_mobile_plugin/b0pass_mobile_plugin_platform_interface.dart';
import 'package:b0pass_mobile_plugin/b0pass_mobile_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockB0passMobilePluginPlatform
    with MockPlatformInterfaceMixin
    implements B0passMobilePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final B0passMobilePluginPlatform initialPlatform = B0passMobilePluginPlatform.instance;

  test('$MethodChannelB0passMobilePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelB0passMobilePlugin>());
  });

  test('getPlatformVersion', () async {
    B0passMobilePlugin b0passMobilePlugin = B0passMobilePlugin();
    MockB0passMobilePluginPlatform fakePlatform = MockB0passMobilePluginPlatform();
    B0passMobilePluginPlatform.instance = fakePlatform;

    expect(await b0passMobilePlugin.getPlatformVersion(), '42');
  });
}
