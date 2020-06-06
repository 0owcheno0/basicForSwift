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
    
    static let sharedInstance = CommonColor()
    
    let black_color_241: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColorRGB(R: 31, G: 42, B: 57)
                } else {
                    return UIColorRGB(R: 238, G: 241, B: 246)
                }
            }
        } else {
            return UIColorRGB(R: 238, G: 241, B: 246)
        }
    }()
    
    let black_color: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColor.white
                } else {
                    return UIColor.black
                }
            }
        } else {
            return UIColor.black
        }
    }()
    
    let white_color: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColor.black
                } else {
                    return UIColor.white
                }
            }
        } else {
            return UIColor.white
        }
    }()
    
    let SVProgressHUDBG_color: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return RGBA(r: 255, g: 255, b: 255, a: 0.6)
                } else {
                    return RGBA(r: 0, g: 0, b: 0, a: 0.6)
                }
            }
        } else {
            return RGBA(r: 0, g: 0, b: 0, a: 0.6)
        }
    }()
    
}
