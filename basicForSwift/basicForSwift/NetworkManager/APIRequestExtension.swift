//
//  APIRequestExtension.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON

class APIRequestExtension: NSObject {

}

// 通常我们希望请求的时候直接把Json转换成Model ，我们可以通过ObservableType 添加扩展 mapModel.
extension ObservableType where Element == Response {
    public func mapModel<T: HandyJSON>(_ Type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.mapModel(T.self))
        }
    }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        guard let object = JSONDeserializer<T>.deserializeFrom(json: try mapString()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
}
