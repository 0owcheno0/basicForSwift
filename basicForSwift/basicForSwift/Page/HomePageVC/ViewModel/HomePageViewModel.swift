//
//  HomePageViewModel.swift
//  basicForSwift
//
//  Created by wchen on 2020/3/13.
//  Copyright © 2020 wchen. All rights reserved.
//

import UIKit

class HomePageViewModel: BaseViewModel {
    // 普通请求
    func requestRecome(complete: @escaping requestSuccessClosure, failError: @escaping requestFailedClosure) {
        provider.rx.request(.recommend).asObservable().mapModel(HomePageModel.self).subscribe(onNext: {model in
            if model.code == 200 {
                complete(model)
            } else {
                failError(model.message)
            }
        }, onError: {error in
            failError(error.localizedDescription)
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposeBag)
    }
    
    // 上传图片
    func uploadImage(paramsDic: NSMutableDictionary, dataAry: [Any], progress: @escaping requestProgress, complete: @escaping requestSuccessClosure, failError: @escaping requestFailedClosure) {
        provider.rx.requestWithProgress(.uploadFile(paramsDic: paramsDic, dataAry: dataAry)).subscribe(onNext: {progressResponse in
            if let response = progressResponse.response {
                do {
                    let model = try response.mapModel(HomePageModel.self)
                    complete(model)
                } catch {
                    print(error)
                }
            } else {
                print("Progress: \(progressResponse.progress)")
                progress(progressResponse.progress)
            }
            
        }, onError: {error in
            failError(error.localizedDescription)
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposeBag)
    }
    
    // 下载文件
    func downloadFile(downloadPath: String, localPath: String, progress: @escaping requestProgress, complete: @escaping requestSuccessClosure, failError: @escaping requestFailedClosure) {
        provider.rx.requestWithProgress(.downloadFile(downloadPath: downloadPath, localPath: localPath)).subscribe(onNext: {progressResponse in
            if let response = progressResponse.response {
                do {
                    let model = try response.mapModel(HomePageModel.self)
                    complete(model)
                } catch {
                    print(error)
                }
            } else {
                print("Progress: \(progressResponse.progress)")
                progress(progressResponse.progress)
            }
            
        }, onError: {error in
            failError(error.localizedDescription)
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).disposed(by: disposeBag)
    }
}
