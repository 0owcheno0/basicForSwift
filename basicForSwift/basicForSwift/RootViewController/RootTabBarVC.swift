//
//  RootTabBarVC.swift
//  BaseFrame
//
//  Created by wchen on 2019/1/23.
//  Copyright © 2019年 cq. All rights reserved.
//

import UIKit

class RootTabBarVC: UITabBarController,UITabBarControllerDelegate {
                
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = CommonColor.sharedInstance.black_color
        self.tabBar.barTintColor = CommonColor.sharedInstance.white_color
        self.tabBar.isTranslucent = false
        
        self.delegate = self
        
        let navViewController1 = RootNavigationController.init(rootViewController: HomePageVC())
        navViewController1.navigationBar.barTintColor = CommonColor.sharedInstance.white_color
        navViewController1.tabBarItem.title = .localized_homePage
        navViewController1.tabBarItem.image = UIImage(named: "home_noSelect")!.withRenderingMode(.alwaysOriginal)
        navViewController1.tabBarItem.selectedImage = UIImage(named: "home_selected")!.withRenderingMode(.alwaysOriginal)
        navViewController1.tabBarItem.tag = 0
        
        let navViewController2 = RootNavigationController.init(rootViewController: HomePageVC())
        navViewController2.navigationBar.barTintColor = CommonColor.sharedInstance.white_color
        navViewController2.tabBarItem.title = .localized_homePage
        navViewController2.tabBarItem.image = UIImage(named: "home_noSelect")!.withRenderingMode(.alwaysOriginal)
        navViewController2.tabBarItem.selectedImage = UIImage(named: "home_selected")!.withRenderingMode(.alwaysOriginal)
        navViewController2.tabBarItem.tag = 1

        self.viewControllers = [navViewController1,navViewController2]
    }
    
    //MARK: UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool
    {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    {
        
    }
}
