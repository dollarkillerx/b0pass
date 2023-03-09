import Flutter
import UIKit
import B0pass

public class B0passMobilePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "b0pass_mobile_plugin", binaryMessenger: registrar.messenger())
    let instance = B0passMobilePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
        case "run":
            result(B0pass.B0passRun())
        case "stop":
            result(B0pass.B0passStop())
        default:
            result("iOS " + UIDevice.current.systemVersion)
    }
  }
}
