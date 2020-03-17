//
//  LoginViewModel.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/17.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

class LoginViewModel: BaseViewModel {

    // 普通请求
    func requestLogin(username: String, password: String, complete: @escaping requestSuccessClosure, failError: @escaping requestFailedClosure) {
        provider.rx.request(.login(username: username, password: password)).asObservable().mapModel(LoginModel.self).subscribe(onNext: {model in
            if model.code == 200 {
                print(model.toJSON() as Any)
                complete(model)
            } else {
                failError(model.message)
            }
        }, onError: {error in
            failError(error.localizedDescription)
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposeBag)
    }
}
