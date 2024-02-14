//
//  ArpltnInforInqireSvcService.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
import Alamofire
import OSLog

public struct ArpltnInforInqireSvcService {

   /// 대기질예보통보조회
   func getMinuDustFrcstDspth(sid: String) -> Observable<Result<AIISBaseResponse<MinuDustFrcstDspthItem>, Error>> {
       print("getMinuDustFrcstDspth22")
        return Observable.create { observer -> Disposable in
            // Alamofire로 서버와 통신하는 부분이다.
            
            APIManager.shared.session.request(ArpltnInforInqireSvcAPI.getMinuDustFrcstDspth(sid: sid))
                .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                .validate(contentType:["application/json"]) // JSON 포맷만 허용
                .responseDecodable(of: AIISBaseResponse<MinuDustFrcstDspthItem>.self) { response in

                    Log.debug("[status code] \(response.response?.statusCode as Any)")
                    
                                        
                    switch response.result {
                    case .success(let data):
//                        print(data)
                        let data0 = try! JSONEncoder().encode(data)
                        let result0 = String(data: data0, encoding: .utf8)!
                        Log.debug(result0)
                       
                        observer.onNext(.success(data))
                        observer.onCompleted()
                    case .failure(let error):
                        print(error)
                        observer.onError(error)
                        
                    }
                }
            
            return Disposables.create()
        }
    }
    
    
    /// 초미세먼지주간예보조회(안쓸예정)
    func getMinuDustWeekFrcstDspth(sid: String) -> Observable<Result<AIISBaseResponse<MinuDustWeekFrcstDspthItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnInforInqireSvcAPI.getMinuDustWeekFrcstDspth(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: AIISBaseResponse<MinuDustWeekFrcstDspthItem>.self) { response in
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
    
    
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getCtprvnRltmMesureDnsty(sid: String) -> Observable<Result<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnInforInqireSvcAPI.getCtprvnRltmMesureDnsty(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>.self) { response in
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
    
    
    /// 통합대기환경지수 나쁨 이상 측정소 목록조회(안쓸예정)
    func getUnityAirEnvrnIdexSnstiveAboveMsrstnList(sid: String) -> Observable<Result<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnInforInqireSvcAPI.getUnityAirEnvrnIdexSnstiveAboveMsrstnList(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>.self) { response in
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
    
    
    /// 시도별 실시간 측정정보 조회 (지도메인)
    func getMsrstnAcctoRltmMesureDnsty(sid: String) -> Observable<Result<AIISBaseResponse<CtprvnRltmMesureDnstyItem>, Error>> {
         return Observable.create { observer -> Disposable in
             // Alamofire로 서버와 통신하는 부분이다.
             APIManager.shared.session.request(ArpltnInforInqireSvcAPI.getMsrstnAcctoRltmMesureDnsty(sid: sid))
                 .validate(statusCode: 200..<300) // 200~300 사이 상태코드만 허용
                 .validate(contentType:["application/json"]) // JSON 포맷만 허용
                 .responseDecodable(of: AIISBaseResponse<CtprvnRltmMesureDnstyItem>.self) { response in
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
