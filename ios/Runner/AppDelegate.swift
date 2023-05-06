import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

        let controller : FlutterViewController = self.window?.rootViewController as! FlutterViewController
        var channel = FlutterMethodChannel(name: "bottom_sheet_method_channel", binaryMessenger: controller.binaryMessenger)
        prepareMethodHandler(deviceChannel: channel)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


  private func prepareMethodHandler(deviceChannel: FlutterMethodChannel) {
        
        deviceChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            if call.method == "getData" {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.receiveDeviceModel(result: result)
                }
            }
            else {
                
                result(FlutterMethodNotImplemented)
                return
            }
            
        })
    }
    
    private func receiveDeviceModel(result: FlutterResult) {
        
        let data: [String: Any] = [
            "distance": "3.08 Miles",
            "date": "5th May",
            "time": "10:02 - 18:32 (30 Minutes)",
            "start_point": "The Hil and Central",
            "end_point": "Melrose & Brighton"
        ]
        
        result(data)
    }
}
