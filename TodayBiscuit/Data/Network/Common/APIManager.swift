//
//  APIManager.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/8/24.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    
    let session: Session = {
        var session = AF
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.waitsForConnectivity = true
        
        let eventLogger = APIEventLogger()
        let interceptor = APIInterceptor()
        
        session = Session(
            configuration: configuration,
            interceptor: interceptor,
            eventMonitors: [eventLogger])
        
        return session
    }()
}

// https://yungsoyu.medium.com/swift-alamofire-advanced-usage-session-autentication-logger-5f0626529777
