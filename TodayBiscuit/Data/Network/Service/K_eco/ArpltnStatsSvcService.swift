//
//  ArpltnStatsSvcService.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
import Alamofire
import OSLog

public struct ArpltnStatsSvcService {
    
    /// 측정소별 실시간 일평균 정보 조회
    func getMsrstnAcctoRDyrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginDt: String? = nil,
                             inqEndDt: String? = nil,
                             msrstnName: String? = nil) -> Observable<Result<ASSBaseResponse<MsrstnAcctoRDyrgItem>, Error>> {
        
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnStatsSvcAPI.getMsrstnAcctoRDyrg(numOfRows: numOfRows,
                                                                                     pageNo: pageNo,
                                                                                     inqBginDt: inqBginDt,
                                                                                     inqEndDt: inqEndDt,
                                                                                     msrstnName: msrstnName))
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
    func getMsrstnAcctoRMmrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginMm: String? = nil,
                             inqEndMm: String? = nil,
                             msrstnName: String? = nil) -> Observable<Result<ASSBaseResponse<MsrstnAcctoRMmrgItem>, Error>> {
        
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnStatsSvcAPI.getMsrstnAcctoRMmrg(numOfRows: numOfRows,
                                                                                     pageNo: pageNo,
                                                                                     inqBginMm: inqBginMm,
                                                                                     inqEndMm: inqEndMm,
                                                                                     msrstnName: msrstnName))
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
    func getCtprvnMesureLIst(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             itemCode: String? = nil,
                             dataGubun: String? = nil,
                             searchCondition: String? = nil) -> Observable<Result<ASSBaseResponse<CtprvnMesureLIstItem>, Error>> {
        
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnStatsSvcAPI.getCtprvnMesureLIst(numOfRows: numOfRows,
                                                                                     pageNo: pageNo,
                                                                                     itemCode: itemCode,
                                                                                     dataGubun: dataGubun,
                                                                                     searchCondition: searchCondition))
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
