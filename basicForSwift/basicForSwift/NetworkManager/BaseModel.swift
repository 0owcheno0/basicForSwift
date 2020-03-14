//
//  BaseModel.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit
import HandyJSON

class BaseModel: HandyJSON {
    var code:Int = 0
    var success:Bool!
    var message:String!
    required init() {}
}
