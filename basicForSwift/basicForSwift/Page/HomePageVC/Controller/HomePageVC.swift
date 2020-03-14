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
        self.title = "首页"
        
        self.view.backgroundColor = UIColor.init(named: "black_color_241")
        
        // 接口请求
        viewModel.requestRecome(complete: { (model) in
            print(model)
        }) { (message) in
            print(message)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
