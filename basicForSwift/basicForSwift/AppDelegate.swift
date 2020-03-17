//
//  AppDelegate.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/12.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 13, *) {
            
        }else {
            window = UIWindow.init(frame: UIScreen.main.bounds)
            let token:String? = UserDefaults.standard.string(forKey: BaseToken)
            if token != nil
            {
                let tabBarVC = RootTabBarVC()
                window!.rootViewController = tabBarVC
            }
            else
            {
                let navViewController = RootNavigationController.init(rootViewController: LoginVC())
                window!.rootViewController = navViewController
            }
            window?.makeKeyAndVisible()
        }
        
        //第三方键盘注册
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        //第三方键盘注册
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        //当SVProgressHUD显示时，用户是否可以点击其他控件 default is SVProgressHUDMaskTypeNone允许
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
        //设置显示时间
        SVProgressHUD.setMinimumDismissTimeInterval(2.0)
        SVProgressHUD.setMaximumDismissTimeInterval(2.0)
        SVProgressHUD.setBackgroundColor(UIColor.init(named: "SVProgressHUD_bg")!)
        SVProgressHUD.setForegroundColor(UIColor.init(named: "white_color")!)
        
        return true
    }
    
}

@available(iOS 13.0, *)
extension AppDelegate {
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

