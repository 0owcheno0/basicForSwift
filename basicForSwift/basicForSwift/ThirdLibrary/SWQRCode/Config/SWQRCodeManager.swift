//
//  SWQRCodeManager.swift
//  SWQRCode_Swift
//
//  Created by zhuku on 2018/4/11.
//  Copyright © 2018年 selwyn. All rights reserved.
//

import UIKit
import Photos

struct SWQRCodeHelper {
    
    /** 校验是否有相机权限 */
    static func sw_checkCamera(completion: @escaping (_ granted: Bool) -> Void) {
        let videoAuthStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch videoAuthStatus {
        // 已授权
        case .authorized:
            completion(true)
        // 未询问用户是否授权
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted) in
                completion(granted)
            })
        // 用户拒绝授权或权限受限
        case .denied, .restricted:
            let strOK : String = .localized_OK
            CommonMethod.showAlertController(WithAlertStyle: UIAlertController.Style.alert, WithVC: self, WithTitle: .localized_cameraRole, WithMsg: nil, WithActionTitles: [strOK], WithCancle: false) { (iIndex) in
                
            }
            completion(false)
        @unknown default:
            completion(false)
        }
    }
    
    /** 校验是否有相册权限 */
    static func sw_checkAlbum(completion: @escaping (_ granted: Bool) -> Void) {
        let photoAuthStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthStatus {
        // 已授权
        case .authorized:
            completion(true)
        // 未询问用户是否授权
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                completion(status == .authorized)
            })
        // 用户拒绝授权或权限受限
        case .denied, .restricted:
            let strOK : String = .localized_OK
            CommonMethod.showAlertController(WithAlertStyle: UIAlertController.Style.alert, WithVC: self, WithTitle: .localized_albumRole, WithMsg: nil, WithActionTitles: [strOK], WithCancle: false) { (iIndex) in
                
            }
            completion(false)
        @unknown default:
            completion(false)
        }
    }
    
    /** 根据扫描器类型配置支持编码格式 */
    static func sw_metadataObjectTypes(type: SWScannerType) -> [AVMetadataObject.ObjectType] {
        switch type {
        case .qr:
            return [.qr]
        case .bar:
            return [.ean13, .ean8, .upce, .code39, .code39Mod43, .code93, .code128, .pdf417]
        case .both:
            return [.qr, .ean13, .ean8, .upce, .code39, .code39Mod43, .code93, .code128, .pdf417]
        }
    }
    
    /** 根据扫描器类型配置导航栏标题 */
    static func sw_navigationItemTitle(type: SWScannerType) -> String {
        switch type {
        case .qr:
            return .localized_QRCode
        case .bar:
            return .localized_barCode
        case .both:
            return .localized_QRAndBarcode
        }
    }
    
    /** 手电筒开关 */
    static func sw_flashlight(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else {
            return
        }
        let settings = AVCapturePhotoSettings.init()
        if device.hasFlash && device.hasTorch {
            try? device.lockForConfiguration()
            device.torchMode = on ? .on:.off
            settings.flashMode = on ? .on:.off
            device.unlockForConfiguration()
        }
    }
}
