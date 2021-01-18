//
//  AppDelegate.swift
//  Apple Pie Code
//
//  Created by Stas Borovtsov on 18.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ViewController()
        window?.backgroundColor = .red
        window?.makeKeyAndVisible()
        return true
    }
}

