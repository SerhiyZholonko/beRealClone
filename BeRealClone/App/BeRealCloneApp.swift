//
//  BeRealCloneApp.swift
//  BeRealClone
//
//  Created by apple on 04.10.2023.
//

import SwiftUI
import Firebase



@main
struct BeRealCloneApp: App {
    @StateObject var viewModel = AuthenticationViewModel()

    @UIApplicationDelegateAdaptor(AppDelegate.self)var delegate
    var body: some Scene {
        WindowGroup {
            Main()
                .environmentObject(viewModel)

        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
//      do {try
//          Auth.auth().signOut()
//      } catch {
//          print(error.localizedDescription)
//      }
      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
          if granted {
              DispatchQueue.main.async {
                  application.registerForRemoteNotifications()
              }
          }
      }

    return true
  }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async ->
    UIBackgroundFetchResult {
        return .noData
    }
}




