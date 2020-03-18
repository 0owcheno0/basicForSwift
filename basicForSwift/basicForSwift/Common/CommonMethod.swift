//
//  CommonMethod.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

class CommonMethod: NSObject {
    
    // 设置页面标题
    static func setDisplayCustomTitle(title: String, color: UIColor) -> UIView {
        let titleView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screen_width/2, height: 44))
        titleView.autoresizesSubviews = true
        titleView.backgroundColor = UIColor.clear
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: titleView.frame.size.width, height: 44))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = color
        titleLabel.font = UIFont.commonFont(fontName: FontName.HelveticaBold, fontSize: 16)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byCharWrapping
        titleLabel.numberOfLines = 0
        titleLabel.text = title
        titleView.addSubview(titleLabel)
        return titleView
    }

    /*
     alterController 多个按钮
     style:UIAlertControllerStyle（.alert和.actionSheet）
     vc:当前控制器
     title: 标题
     msg: 提示消息
     titles:按钮标题数组
     bCancel:是否显示取消按钮
     actionBlock:按钮点击处理
     iIndex-1判断是第几个，0默认为取消
     */
    static func showAlertController(WithAlertStyle style:UIAlertController.Style!, WithVC vc:Any!,WithTitle title:String!,WithMsg msg:String!,WithActionTitles titles:Array<Any>!,WithCancle bCancel:Bool!,WithActionBlock actionBlock: @escaping ((_ iIndex:Int) -> ()))
    {
        let alert = UIAlertController.init(title: title, message: msg, preferredStyle: style)
        if titles.count != 0
        {
            for iIndex in 0...(titles.count - 1)
            {
                let strAcTitle = titles[iIndex]
                let action = UIAlertAction.init(title: (strAcTitle as! String), style: UIAlertAction.Style.default) { (UIAlertAction) in
                    actionBlock(iIndex + 1)
                }
                alert.addAction(action)
            }
        }
        
        if (bCancel)
        {
            let cancelAction = UIAlertAction.init(title: .localized_Cancel, style: UIAlertAction.Style.cancel) { (UIAlertAction) in
                actionBlock(0)
            }
            alert.addAction(cancelAction)
        }
        
        if let rootVC = CommonMethod.findVisibleViewController() {
            rootVC.present(alert, animated: true, completion: nil)
        }
    }
    
    //获取根控制器
    static func getRootViewController() -> UIViewController? {
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
        return window!.rootViewController
    }
    
    //获取当前视图所在导航控制器
    static func findVisibleViewController() -> UIViewController? {
        
        var currentViewController = CommonMethod.getRootViewController()
        
        let runLoopFind = true
        while runLoopFind {
            if currentViewController?.presentedViewController != nil {
                currentViewController = currentViewController?.presentedViewController
            } else {
                if (currentViewController is UINavigationController) {
                    currentViewController = (currentViewController as? UINavigationController)?.visibleViewController
                } else if (currentViewController is UITabBarController) {
                    currentViewController = (currentViewController as? UITabBarController)?.selectedViewController
                } else {
                    break
                }
            }
        }
        return currentViewController
    }

}

extension String{
    func ga_heightForReason() -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: screen_width - 100, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.commonFont(fontName: FontName.PingFangSCRegular, fontSize: 16)], context: nil)
        
        return ceil(rect.height)
    }
    
    func ga_widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        let font = UIFont.commonFont(fontName: FontName.PingFangSCRegular, fontSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.width)
    }
    
    func ga_heightForComment(fontSize: CGFloat, width: CGFloat) -> CGFloat {
        let font = UIFont.commonFont(fontName: FontName.PingFangSCRegular, fontSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)
    }
    
    func ga_heightForComment(fontSize: CGFloat, width: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let font = UIFont.commonFont(fontName: FontName.PingFangSCRegular, fontSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)>maxHeight ? maxHeight : ceil(rect.height)
    }
    
    //将原始的url编码为合法的url(接口请求特殊字符处理)
    func urlEncoded() -> String {

        let KUrlCodingReservedCharacters = "!*'();:|@&=+$,/?%#[]{}"
        
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: KUrlCodingReservedCharacters).inverted)
        
        return encodeUrlString ?? ""
    }
    
    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}


extension Date{
    //MARK: - 获取日期各种值
    //MARK: 年
    func year() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: self)
        return com.year!
    }
    
    //MARK: 月
    func month() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: self)
        return com.month!
    }
    
    //MARK: 日
    func day() ->Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: self)
        return com.day!
    }
    
    //MARK: 时
    func hour() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: self)
        return com.hour!
    }
    
    //MARK: 分
    func minute() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day,.hour,.minute], from: self)
        return com.minute!
    }
    
    //MARK: 星期几
    func weekDay()->Int{
        let interval = Int(self.timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        return weekday == 0 ? 7 : weekday
    }
    
    //MARK: 当月天数
    func countOfDaysInMonth() ->Int {
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: self)
        return (range?.length)!
        
    }
    
    //MARK: 当月第一天是星期几
    func firstWeekDay() ->Int {
        //1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let firstWeekDay = (calendar as NSCalendar?)?.ordinality(of: NSCalendar.Unit.weekday, in: NSCalendar.Unit.weekOfMonth, for: self)
        return firstWeekDay! - 1
        
    }
    
    //MARK: - 日期的一些比较
    //是否是今天
    func isToday()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month && com.day == comNow.day
    }
    
    //是否是这个月
    func isThisMonth()->Bool {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: self)
        let comNow = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year == comNow.year && com.month == comNow.month
    }
    
    //是否是同一天
    func isThisDay(otherDay:Date) -> Bool {
        
        if self.year() == otherDay.year() && self.month() == otherDay.month() && self.day() == otherDay.day() {
            return true
        }else{
            return false
        }
    }
}


extension UIView{
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}
