//
//  LoginVC.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/14.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

class LoginVC: RootChildViewController {

    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = CommonMethod.setDisplayCustomTitle(title: .localized_login, color: UIColor.init(named: "black_color")!)
        
        self.view.backgroundColor = UIColor.init(named: "black_color_241")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: .localized_scan, style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightItemClick))
        
        // 接口请求
        viewModel.requestLogin(username: "", password: "", complete: { (model) in
            
        }) { (message) in
            SVProgressHUD.showError(withStatus: message)
        }
    }
    
    @objc func rightItemClick() {
        
        let qrcodeVC = SWQRCodeViewController()
        self.navigationController?.pushViewController(qrcodeVC, animated: true)
    }

}
