//
//  BaseViewModel.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON

/*
 通常我们调试或排查接口的时候都会看请求的log，Moya 框架提供了默认4个插件:

 AccessTokenPlugin          管理AccessToken的插件
 CredentialsPlugin          管理认证的插件
 NetworkActivityPlugin      管理网络状态的插件
 NetworkLoggerPlugin        管理网络log的插件
 */

typealias requestProgress = (_ progress: Double) -> ()
typealias requestFailedClosure = (_ error: String) -> ()
typealias requestSuccessClosure = (_ obj: Any) -> ()

// ViewModel基类
class BaseViewModel: NSObject {
    let disposeBag = DisposeBag.init()
//    let provider = MoyaProvider<APIManager>.init()
    #if DEBUG
    let provider = MoyaProvider<APIManager>(plugins:[NetworkLoggerPlugin.init()])
    #else
    let provider = MoyaProvider<APIManager>()
    #endif
}
