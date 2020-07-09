//
//  AppDelegate.swift
//  swiftUIExample
//
//  Created by user174699 on 7/8/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        UITableView.appearance().allowsSelection = false
        UITableViewCell.appearance().selectionStyle = .none
        
        let navigationBarAppearace = UINavigationBar.appearance()
        let barButtonAppearance = UIBarButtonItem.appearance()
        
        if let backIcon = UIImage(named: "ic_back_reversed")?.withRenderingMode(.alwaysOriginal) {
            barButtonAppearance.setBackButtonBackgroundImage(backIcon, for: .normal, barMetrics: .default)
            navigationBarAppearace.backIndicatorImage = backIcon
            navigationBarAppearace.backIndicatorTransitionMaskImage = backIcon
            navigationBarAppearace.backItem?.leftItemsSupplementBackButton = true
            navigationBarAppearace.backItem?.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

