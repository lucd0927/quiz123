import Flutter
import UIKit
import AppTrackingTransparency
import flutter_local_notifications
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
          GeneratedPluginRegistrant.register(with: registry)
      }
      if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
      }
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
