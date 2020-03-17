//
//  LoginModel.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/17.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit
import HandyJSON

class LoginModel: BaseModel {
    var data : LoginInfoModel? = nil        // 登录信息
    required init() {}
}

class LoginInfoModel: HandyJSON {
    var userId : String? = ""               // 用户id
    var nickName : String? = ""             // 用户昵称
    var headImage : String? = ""            // 用户头像
    var unitName : String? = ""             // 用户所属部门
    var unitId : String? = ""               // 用户所属部门id
    var siteId : String? = ""               // 0：垃圾回收中心，其他：站点
    var token : String? = ""                // token
    var list : [LoginMenuTypeModel]? = []   // 首页分类列表
    required init() {}
}

class LoginMenuTypeModel: HandyJSON {
    
    var title : String? = ""        // 首页分类名
    var menuList : [String]? = []   // 首页菜单列表
    required init() {}
}
