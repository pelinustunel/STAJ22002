//
//  AppDelegate.swift
//  SnowballProject
//
//  Created by Pelin Üstünel on 25.07.2024.
//

import UIKit
import AlamofireNetworkActivityLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static var rootNavigationController: UINavigationController? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
#if DEBUG
    print("NetworkActivityLogger is starting...")
    NetworkActivityLogger.shared.level = .debug
    NetworkActivityLogger.shared.startLogging()
    print("NetworkActivityLogger has started.")
#endif
        
        // Override point for customization after application launch.
        
        //        window = UIWindow(frame: UIScreen.main.bounds)
        //        let rootViewController = ScriptViewController()
        //        window?.rootViewController = rootViewController
        //
        //        window?.makeKeyAndVisible()
        
        // UIWindow'u oluştur ve ana view controller'ı ata
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        setupNavigationBar()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
        
    }
    
    func setupNavigationBar() {
        
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
}

