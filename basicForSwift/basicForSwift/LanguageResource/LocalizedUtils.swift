import Foundation

extension String {
  var localized: String { return NSLocalizedString(self, comment: self) }
/* 
  Localizable.strings
  basicForSwift

  Created by wchen on 2020/3/14.
  Copyright © 2020 wchen. All rights reserved.
*/

  static var localized_homePage: String { return "homePage".localized }
  static var localized_login: String { return "login".localized }

}
