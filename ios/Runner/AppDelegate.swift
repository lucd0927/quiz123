import Flutter
import UIKit
import AppTrackingTransparency

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
                ATTrackingManager.requestTrackingAuthorization { status in
                            switch status {
                            case .authorized:
                                break
                            case .denied,
                                    .notDetermined,
                                    .restricted:
                                break
                            @unknown default:
                                break
                            }
                        }
            }
}
