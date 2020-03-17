//
//  CommonFont.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

class CommonFont: NSObject {
    
}

//MARK: 字体
// 字体大小
enum FontType: Int {
    case nomal = 0      // 正常
    case middle = 1     // 中
    case big = 2        // 大
}

// 字体类型
enum FontName: String {
    case Helvetica = "Helvetica"
    case HelveticaBold = "Helvetica-Bold"
    case PingFangSCRegular = "PingFangSC-Regular"
    case PingFangSCMedium = "PingFangSC-Medium"
}

extension UIFont {
    static func commonFont(fontName: FontName ,fontSize: CGFloat) -> UIFont {
        if let fontIndex = UserDefaults.standard.string(forKey: BaseFont) {
            var font: UIFont = UIFont.init()
            switch Int(fontIndex) {
            case FontType.nomal.rawValue:
                font = UIFont.init(name: fontName.rawValue, size: fontSize)!
            case FontType.middle.rawValue:  // 中字体统一加2
                font = UIFont.init(name: fontName.rawValue, size: fontSize + 2)!
            case FontType.big.rawValue:     // 大字体统一加4
                font = UIFont.init(name: fontName.rawValue, size: fontSize + 4)!
            default:
                font = UIFont.init(name: fontName.rawValue, size: fontSize)!
            }
            return font
        } else {
            return UIFont.init(name: fontName.rawValue, size: fontSize)!
        }
    }
}
