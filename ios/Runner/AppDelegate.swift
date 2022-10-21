import UIKit
import Flutter
import Firebase
import GoogleMaps
import FirebaseAuth
import UserNotifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     FirebaseApp.configure()
//     GMSServices.provideAPIKey("AIzaSyCmX95L2PM9EGJv25LLQmwDLf5WGFv0e3U")
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
//   override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//           let firebaseAuth = Auth.auth()
//           firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
//       }
//       override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//           let firebaseAuth = Auth.auth()
//           if (firebaseAuth.canHandleNotification(userInfo)){
//               print(userInfo)
//               return
//           }
//       }
 override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyCmX95L2PM9EGJv25LLQmwDLf5WGFv0e3U")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
          let firebaseAuth = Auth.auth()
          firebaseAuth.setAPNSToken(deviceToken, type: AuthAPNSTokenType.unknown)
      }
      override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
          let firebaseAuth = Auth.auth()
          if (firebaseAuth.canHandleNotification(userInfo)){
              print(userInfo)
              return
          }
      }
}
