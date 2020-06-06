//
//  RootViewController.swift
//  SmartAction
//
//  Created by 陈清 on 2018/11/18.
//  Copyright © 2018 cqqqq. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = CommonColor.sharedInstance.black_color_241

        self.navigationController?.navigationBar.tintColor = CommonColor.sharedInstance.black_color
        self.navigationController?.navigationBar.barTintColor = CommonColor.sharedInstance.white_color
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        if (self.navigationController?.viewControllers.count)! > 1 {
            let backItem = UIBarButtonItem.init(image: UIImage.init(named: "Arrow_left"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(backAction))
            self.navigationItem.leftBarButtonItem = backItem
        }
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func backAction()
    {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
