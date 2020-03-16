import Foundation

extension String {
  var localized: String { return NSLocalizedString(self, comment: self) }
/* 
  Localizable.strings
  basicForSwift

  Created by wchen on 2020/3/14.
  Copyright © 2020 wchen. All rights reserved.
*/

  static var localized_OK: String { return "确定".localized }
  static var localized_Cancel: String { return "取消".localized }
  static var localized_cameraRole: String { return "请在”设置-隐私-相机”选项中，允许访问你的相机".localized }
  static var localized_albumRole: String { return "请在”设置-隐私-相片”选项中，允许访问你的相册".localized }
  static var localized_QRCode: String { return "二维码".localized }
  static var localized_barCode: String { return "条形码".localized }
  static var localized_QRAndBarcode: String { return "二维码/条码".localized }
  static var localized_scanInstruct: String { return "将二维码/条码放入框内，即可自动扫描".localized }
  static var localized_openLight: String { return "轻触照亮".localized }
  static var localized_closeLight: String { return "轻触关闭".localized }
  static var localized_album: String { return "相册".localized }
  static var localized_scan: String { return "扫一扫".localized }
  static var localized_imagePreview: String { return "图片预览".localized }

  static var localized_homePage: String { return "首页".localized }
  static var localized_login: String { return "登录".localized }


}
