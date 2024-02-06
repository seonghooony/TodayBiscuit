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
             AF.request(ArpltnStatsSvcAPI.getMsrstnAcctoRDyrg(sid: sid))
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
             AF.request(ArpltnStatsSvcAPI.getMsrstnAcctoRMmrg(sid: sid))
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
             AF.request(ArpltnStatsSvcAPI.getCtprvnMesureLIst(sid: sid))
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
