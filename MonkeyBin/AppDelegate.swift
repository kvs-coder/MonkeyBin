//
//  AppDelegate.swift
//  MonkeyBin
//
//  Created by Victor Kachalov on 20.05.19.
//  Copyright © 2019 Victor Kachalov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().isHidden = true
        loadMainViewController()
        return true
    }

}

extension AppDelegate {
    
    private func loadMainViewController() {
        let startVC = StartViewController()
        loadViewController(startVC)
    }
    
    private func loadViewController(_ vc: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
    
}

