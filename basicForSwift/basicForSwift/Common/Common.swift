//
//  Common.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/12.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

//MARK: 数据本地化
//缓存路径会被系统清理
let documentsCachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
//本地路径不会被清理
let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
/************** UserDefaults **************/
let BaseToken = "base_token"            //登录返回的token
let BaseFont = "base_font"              //字体大小

//MARK: 分页数
let pageCount = 20

//MARK: 第三方功能接入Key

//MARK: 屏幕尺寸
// 等比缩放位置
let scale_width: CGFloat! = UIScreen.main.bounds.size.width/375
let scale_height: CGFloat! = UIScreen.main.bounds.size.height/667
let screen_width: CGFloat! = UIScreen.main.bounds.size.width
let screen_height: CGFloat! = UIScreen.main.bounds.size.height
let isIphoneXAndUp : Bool = Common.getStatusBarHeight() > 20 ? true : false
// statusBar高度
let kStatusBarHeight: CGFloat = Common.getStatusBarHeight()
let kNavBarHeight: CGFloat = (Common.getStatusBarHeight() > 20 ? 88:64)
let kTabBarHeight: CGFloat = (Common.getStatusBarHeight() > 20 ? 83:49)

class Common: NSObject {    
    
    // 获取StatusBar高度
    static func getStatusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0.0
        if #available(iOS 13.0, *) {
            let statusBarManager = UIApplication.shared.windows.first?.windowScene?.statusBarManager
            statusBarHeight = (statusBarManager?.statusBarFrame.size.height)!
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        }
        return statusBarHeight
    }
}
