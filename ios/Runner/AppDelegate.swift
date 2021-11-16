import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var apiKey = ProcessInfo.processInfo.environment["GOOGLE_MAPS_API_KEY"]
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     
      GMSServices.provideAPIKey("AIzaSyAPNfu9TORI5e6M9nYPXlJyfWBQCALUtao")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
