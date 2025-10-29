//
//  AppDelegate.swift
//  AlgorithmShowCase
//
//  Created by Nestor Hernandez on 20/11/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = HomeView()
        self.window?.makeKeyAndVisible()
        return true
    }



}

