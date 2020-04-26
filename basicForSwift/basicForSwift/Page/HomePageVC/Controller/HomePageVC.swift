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
        self.navigationItem.titleView = CommonMethod.setDisplayCustomTitle(title: .localized_homePage, color: UIColor.init(named: "black_color")!)
        
        self.view.backgroundColor = UIColor.init(named: "black_color_241")
        
    }
    
}
