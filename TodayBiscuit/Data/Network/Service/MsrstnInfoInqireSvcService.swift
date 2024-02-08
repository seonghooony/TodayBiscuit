//
//  MsrstnInfoInqireSvcService.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
import Alamofire

import OSLog

public struct MsrstnInfoInqireSvcService {
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getMsrstnList(sid: String) -> Observable<Result<MIISBaseResponse<MsrstnListItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(MsrstnInfoInqireSvcAPI.getMsrstnList(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: MIISBaseResponse<MsrstnListItem>.self) { response in
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
    
    /// 근접측정소 목록 조회
    func getNearbyMsrstnList(sid: String) -> Observable<Result<MIISBaseResponse<NearbyMsrstnListItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(MsrstnInfoInqireSvcAPI.getNearbyMsrstnList(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: MIISBaseResponse<NearbyMsrstnListItem>.self) { response in
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
    
    /// TM 기준좌표 조회
    func getTMStdrCrdnt(sid: String) -> Observable<Result<MIISBaseResponse<TMStdrCrdntItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(MsrstnInfoInqireSvcAPI.getTMStdrCrdnt(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: MIISBaseResponse<TMStdrCrdntItem>.self) { response in
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
