//
//  HomePageModel.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit
import HandyJSON

class HomePageModel: BaseModel {
    var data:ResultModel?
    
    required init() {}
}

class ResultModel: HandyJSON {
    var author:String!
    var content:String!
    var category:String!
    var origin:String!
    required init() {}
}
