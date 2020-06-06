//
//  HomePageVC.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

class HomePageVC: RootViewController {

    let viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = CommonMethod.setDisplayCustomTitle(title: .localized_homePage, color: CommonColor.sharedInstance.black_color)
        
        self.view.backgroundColor = CommonColor.sharedInstance.black_color_241
        
    }
    
}
