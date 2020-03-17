//
//  APIManager.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/12.
//  Copyright © 2020 wchen. All rights reserved.
//


/*
 Moya接口请求
 let provider = MoyaProvider<APIManager>();
 provider.request(.search(name: "李白")) { (result) in
     switch result {
     case .success(let response):
         do {
             let any = try response.mapJSON()
             print(any)
         } catch {
             print(error)
         }
     case .failure(let error):
         print(error)
     }
     
 }
 */

import UIKit
import Moya
import MobileCoreServices

enum APIManager {
    case uploadFile(paramsDic: NSMutableDictionary, dataAry: [Any])     // 上传图片
    case downloadFile(downloadPath: String, localPath: String)          // 下载文件
    case login(username: String, password: String)                      // 登录
    case search(name:String, page:String, pageCount:String)
}

extension APIManager: TargetType {
    //基础URL
    var baseURL: URL {
        switch self {
        case .uploadFile(_, _):
            return URL(string: "http://api.apiopen.upload")!
        case .downloadFile(downloadPath: let downloadPath, _):
            return URL(string: downloadPath)!
        default:
            return URL(string: "http://")!
        }
    }
    
    //RUL 路径
    var path: String {
        switch self {
        case .uploadFile(_, _):
            return ""
        case .downloadFile(_, _):
            return ""
        case .login(_, _):
            return ""
        case .search( _, _, _):
            return ""
        }
    }
    
    //请求类型
    var method: Moya.Method {
        switch self {
        case .uploadFile(_, _):
            return .post
            
        case .downloadFile(_, _):
            return .get
            
        case .login(_, _):
            return .post
            
        case .search( _, _, _):
            return .post
        }
    }
    
    //请求参数类型
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .login(_, _):
            return JSONEncoding.default
        case .search( _, _, _):
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    //请求任务
    var task: Task {
        switch self {
        case .uploadFile(paramsDic: let paramsDic, dataAry: let dataAry):
            let formDataAry:NSMutableArray = NSMutableArray()
            for (index,image) in dataAry.enumerated() {
                //图片转成Data
                let data:Data = (image as! UIImage).jpegData(compressionQuality: 0.9)!
                //根据当前时间设置图片上传时候的名字
                let date:Date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"
                var dateStr:String = formatter.string(from: date as Date)
                //别忘记这里给名字加上图片的后缀哦
                dateStr = dateStr.appendingFormat("-%i.png", index)
                
                let formData = MultipartFormData(provider: .data(data), name: "file", fileName: dateStr, mimeType: "image/jpeg")
                formDataAry.add(formData)
            }
            return .uploadCompositeMultipart(formDataAry as! [MultipartFormData], urlParameters: paramsDic as! [String : Any])
            
        case .downloadFile(_, localPath: let localPath):
            let downloadDestination:DownloadDestination = { _, _ in
                return (URL(string: localPath)!, .removePreviousFile) }
            return .downloadDestination(downloadDestination)
            
        case .login(username: let username, password: let password):
            var parameters : [String: Any] = [:]
            parameters = ["username" : username, "password" : password]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .search(name: let name, page: let page, pageCount: let pageCount):
            var parameters : [String: Any] = [:]
            parameters = ["name" : name, "page" : page , "pageCount" : pageCount]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    //请求header添加参数
    var headers: [String : String]? {
        var headers: [String : String] = [:]
        if let token = UserDefaults.standard.string(forKey: BaseToken) {
            headers = [
                "Token": token,
                "Content-Type": "application/json"
            ]
        } else {
            headers = [
                "Content-Type": "application/json"
            ]
        }
        return headers
    }
    
    //单元测试
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    /*
     //根据后缀获取对应的Mime-Type
     1.固定获取mimeType
     let mimeType1 = mimeType(pathExtension: "pdf")
     
     2.动态获取mimeType
     let url = URL(fileURLWithPath: path)
     let mimeType2 = mimeType(pathExtension: url.pathExtension)
     */
    func mimeType(pathExtension: String) -> String {
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension,
                                                           pathExtension as NSString,
                                                           nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?
                .takeRetainedValue() {
                return mimetype as String
            }
        }
        //文件资源类型如果不知道，传万能类型application/octet-stream，服务器会自动解析文件类
        return "application/octet-stream"
    }
}
