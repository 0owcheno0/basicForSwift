//
//  CommonColor.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

// MARK:- 颜色方法
func UIColorRGB(R:CGFloat,G:CGFloat,B:CGFloat) -> UIColor{
    return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: 1.0)
}

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}


func kRGBColorFromHex(rgbValue: Int) -> UIColor {
    return UIColor (red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                    green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                    blue: ((CGFloat)((rgbValue & 0xFF)) / 255.0),
                    alpha: 1.0)
}

class CommonColor: NSObject {
    
    
}
