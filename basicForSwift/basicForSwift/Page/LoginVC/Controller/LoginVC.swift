//
//  LoginVC.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/14.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit
import SnapKit

class LoginVC: RootChildViewController {

    let viewModel = LoginViewModel()
    
    var btnLogin: UIButton = {
        let btnLogin = UIButton.init(type: UIButton.ButtonType.custom)
        btnLogin.setTitle(.localized_login, for: UIControl.State.normal)
        btnLogin.addTarget(self, action: #selector(btnLoginClick), for: UIControl.Event.touchUpInside)
        btnLogin.setTitleColor(UIColor.init(named: "white_color"), for: UIControl.State.normal)
        btnLogin.backgroundColor = UIColor.init(named: "black_color")
        return btnLogin
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = CommonMethod.setDisplayCustomTitle(title: .localized_login, color: UIColor.init(named: "black_color")!)
        
        self.view.backgroundColor = UIColor.init(named: "black_color_241")
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: .localized_scan, style: UIBarButtonItem.Style.plain, target: self, action: #selector(rightItemClick))
        
        self.view.addSubview(self.btnLogin)
        self.btnLogin.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(45)
        }
        
        // 接口请求
//        viewModel.requestLogin(username: "", password: "", complete: { (model) in
//            
//        }) { (message) in
//            SVProgressHUD.showError(withStatus: message)
//        }
    }
    
    @objc func rightItemClick() {
        
        let qrcodeVC = SWQRCodeViewController()
        self.navigationController?.pushViewController(qrcodeVC, animated: true)
    }
    
    @objc func btnLoginClick() {
        
        let tabBarVC = RootTabBarVC()
        var window: UIWindow?
        if #available(iOS 13, *) {
            let scene = UIApplication.shared.connectedScenes.first
            if ((scene?.delegate?.conforms(to: UIWindowSceneDelegate.self))!) {
                window = (scene?.delegate as! UIWindowSceneDelegate).window!
            } else {
                window = (UIApplication.shared.delegate?.window)!
            }
        } else {
            window = (UIApplication.shared.delegate?.window)!
        }
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }
}
