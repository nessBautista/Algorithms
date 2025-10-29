//
//  AppDelegate.swift
//  TwitterDemo
//
//  Created by Nestor Hernandez on 22/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	let container: DependencyContainer = DependencyContainer()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.main.bounds)
		let rootVC = container.makeMainViewController()
		self.window?.rootViewController = rootVC
		self.window?.makeKeyAndVisible()
		
		return true
	}

	
}

