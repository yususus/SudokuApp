//
//  SudokuAppApp.swift
//  SudokuApp
//
//  Created by yusuf on 6.03.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        // Check if user is already logged in
        if Auth.auth().currentUser != nil {
            // If user is logged in, navigate to GameView
            let rootView = GameView()
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = UIHostingController(rootView: rootView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
        return true
    }
    
    var window: UIWindow?
}
@main
struct SudokuAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            GameView()
        }
    }
}
