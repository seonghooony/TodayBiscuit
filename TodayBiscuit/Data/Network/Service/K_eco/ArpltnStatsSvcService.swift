//
//  ArpltnStatsSvcService.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
import Alamofire

public struct ArpltnStatsSvcService {
    
    /// 측정소별 실시간 일평균 정보 조회
    func getMsrstnAcctoRDyrg(sid: String) -> Observable<Result<ASSBaseResponse<MsrstnAcctoRDyrgItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnStatsSvcAPI.getMsrstnAcctoRDyrg(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: ASSBaseResponse<MsrstnAcctoRDyrgItem>.self) { response in
                     print("[status code] \(response.response?.statusCode as Any)")
                     
                     switch response.result {
                     case .success(let data):
                         observer.onNext(.success(data))
                     case .failure(let error): 
                         observer.onError(error)
                     }
                 }
             
             return Disposables.create()
         }
     }
    
    
    /// 측정소별 실시간 월평균 정보 조회
    func getMsrstnAcctoRMmrg(sid: String) -> Observable<Result<ASSBaseResponse<MsrstnAcctoRMmrgItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnStatsSvcAPI.getMsrstnAcctoRMmrg(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: ASSBaseResponse<MsrstnAcctoRMmrgItem>.self) { response in
                     print("[status code] \(response.response?.statusCode as Any)")
                     
                     switch response.result {
                     case .success(let data):
                         observer.onNext(.success(data))
                     case .failure(let error):
                         observer.onError(error)
                     }
                 }
             
             return Disposables.create()
         }
     }
    
    /// 시도별 실시간 평균정보 조회
    func getCtprvnMesureLIst(sid: String) -> Observable<Result<ASSBaseResponse<CtprvnMesureLIstItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnStatsSvcAPI.getCtprvnMesureLIst(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: ASSBaseResponse<CtprvnMesureLIstItem>.self) { response in
                     print("[status code] \(response.response?.statusCode as Any)")
                     
                     switch response.result {
                     case .success(let data):
                         observer.onNext(.success(data))
                     case .failure(let error):
                         observer.onError(error)
                     }
                 }
             
             return Disposables.create()
         }
     }
}

// 참고: https://jkim68888.tistory.com/18 [Jihyun Kim:티스토리]
