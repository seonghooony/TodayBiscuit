//
//  APIInterceptor.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/8/24.
//

import Foundation
import Alamofire

class APIInterceptor: RequestInterceptor {
    
    //1
    let retryLimit = 3
    let retryDelay: TimeInterval = 30
    
    //2
    /// 네트워크를 통해 요청되기 전에 실행
    func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        var urlRequest = urlRequest
        
        // 예를들어 헤더에 auth를 등록하려면 하단처럼 한다
        /*
        if let token = TokenStorage.shared.accessToken {
            urlRequest.setValue("token \(token)", forHTTPHeaderField: "Authorization")
        }
         */
        
        completion(.success(urlRequest))
    }
    
    //3
    /// 요청에 에러가 발생했을 때만 실행
    func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void
    ) {
        
        // 예를들어 401에러일때만
        guard let response = request.task?.response as? HTTPURLResponse,
              response.statusCode == 401 else {
            return completion(.doNotRetryWithError(error))
        }

        // 토큰 갱신
        /*
         refreshToken { result in
            switch result {
            case .success(let token):
                // ⭐️
                TokenStorage.shared.accessToken = token
                if request.retryCount < retryLimit {
                    completion(.retryWithDelay(retryDelay))
                }
                // ⭐️
            case .failure(let error):
                completion(.doNotRetryWithError(error))
            }
        }
        */
        
        completion(.retryWithDelay(retryDelay))
    }
}


//https://yungsoyu.medium.com/swift-alamofire-advanced-usage-session-autentication-logger-5f0626529777
