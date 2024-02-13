//
//  ArpltnInforInqireSvcAPI.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
import Alamofire


public enum ArpltnInforInqireSvcAPI {
    /// 대기질예보통보조회
    case getMinuDustFrcstDspth(sid: String)
    /// 초미세먼지주간예보조회(안쓸예정)
    case getMinuDustWeekFrcstDspth(sid: String)
    /// 측정소별 실시간 측정정보 조회(주 메인)
    case getMsrstnAcctoRltmMesureDnsty(sid: String)
    /// 통합대기환경지수 나쁨 이상 측정소 목록조회(안쓸예정)
    case getUnityAirEnvrnIdexSnstiveAboveMsrstnList(sid: String)
    /// 시도별 실시간 측정정보 조회 (지도메인)
    case getCtprvnRltmMesureDnsty(sid: String)
}

extension ArpltnInforInqireSvcAPI: BaseAPIRouter, URLRequestConvertible {
    // Base Url
    public var baseURL: String {
        return "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc"
    }
    
    // Base Url 뒤에 붙는 path
    public var path: String {
        switch self {
        case .getMinuDustFrcstDspth:
            return "/getMinuDustFrcstDspth"
        case .getMinuDustWeekFrcstDspth:
            return "/getMinuDustWeekFrcstDspth"
        case .getMsrstnAcctoRltmMesureDnsty:
            return "/getMsrstnAcctoRltmMesureDnsty"
        case .getUnityAirEnvrnIdexSnstiveAboveMsrstnList:
            return "/getUnityAirEnvrnIdexSnstiveAboveMsrstnList"
        case .getCtprvnRltmMesureDnsty:
            return "/getCtprvnRltmMesureDnsty"
        }
    }
    
    // API 요청 방식
    public var method: HTTPMethod {
        switch self {
        case .getMinuDustFrcstDspth,
                .getMinuDustWeekFrcstDspth,
                .getMsrstnAcctoRltmMesureDnsty,
                .getUnityAirEnvrnIdexSnstiveAboveMsrstnList,
                .getCtprvnRltmMesureDnsty:
            return .get
        }
    }
    
    // API 요청 헤더
    public var headers: [String: String] {
        switch self {
//        case let .getCtprvnRltmMesureDnsty(sid), let .getCtprvnRltmMesureDnsty(sid):
//            return [
//                "Content-Type": "application/json",
//                "sid": sid
//            ]
            
        default:
            return [:]
        }
    }
    
    // 서버에 보낼 데이터
    public var parameters: [String: Any]? {
        switch self {
        case let .getMinuDustFrcstDspth(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                //"numOfRows" : "9999",
                //"pageNo" : "1",
                "searchDate" : "2024-02-06",
                //"InformCode" : "PM10",
                "ver" : "1.1"
            ]
            
        case let .getMinuDustWeekFrcstDspth(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                //"numOfRows" : "9999",
                //"pageNo" : "1",
                "searchDate" : "2024-02-05",
            ]

            
        case let .getMsrstnAcctoRltmMesureDnsty(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                //"numOfRows" : "9999",
                //"pageNo" : "1",
                "stationName" : "소사본동",
                "dataTerm" : "DAILY",
                "ver" : "1.3"
            ]
            
        case let .getUnityAirEnvrnIdexSnstiveAboveMsrstnList(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json"
                //"numOfRows" : "9999",
                //"pageNo" : "1",
            ]
            
        case let .getCtprvnRltmMesureDnsty(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                "numOfRows" : "9999",
                "pageNo" : "1",
                "sidoName" : "전국"
            ]
        }
    }
    
    // 인코딩 방식
    // 파라미터로 보내야할 것이 있다면, URLEncoding.default
    // 바디에 담아서 보내야할 것이 있다면, JSONEncoding.default
    public var encoding: ParameterEncoding? {
        switch self {
        case .getMinuDustFrcstDspth,
                .getMinuDustWeekFrcstDspth,
                .getMsrstnAcctoRltmMesureDnsty,
                .getUnityAirEnvrnIdexSnstiveAboveMsrstnList,
                .getCtprvnRltmMesureDnsty:
            return URLEncoding.default
        }
    }
    
    // request 구성하여 리턴
    public func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURL + path)
        var request = URLRequest(url: url!)
        
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        if let encoding = encoding {
            return try encoding.encode(request, with: parameters)
        }

        return request
    }
}

//참고: https://jkim68888.tistory.com/18 [Jihyun Kim:티스토리]
