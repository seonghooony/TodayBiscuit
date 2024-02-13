//
//  ArpltnStatsSvcAPI.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//


import Foundation

import RxSwift
import Alamofire


public enum ArpltnStatsSvcAPI {
    /// 측정소별 실시간 일평균 정보 조회
    case getMsrstnAcctoRDyrg(sid: String)
    /// 측정소별 실시간 월평균 정보 조회
    case getMsrstnAcctoRMmrg(sid: String)
    /// 시도별 실시간 평균정보 조회
    case getCtprvnMesureLIst(sid: String)
    /// 시군구별 실시간 평균정보 조회
    // 동작안해서 추가안함
}

extension ArpltnStatsSvcAPI: BaseAPIRouter, URLRequestConvertible {
    // Base Url
    public var baseURL: String {
        return "http://apis.data.go.kr/B552584/ArpltnStatsSvc"
    }
    
    // Base Url 뒤에 붙는 path
    public var path: String {
        switch self {
        case .getMsrstnAcctoRDyrg:
            return "/getMsrstnAcctoRDyrg"
        case .getMsrstnAcctoRMmrg:
            return "/getMsrstnAcctoRMmrg"
        case .getCtprvnMesureLIst:
            return "/getCtprvnMesureLIst"


        }
    }
    
    // API 요청 방식
    public var method: HTTPMethod {
        switch self {
        case .getMsrstnAcctoRDyrg,
                .getMsrstnAcctoRMmrg,
                .getCtprvnMesureLIst:
            return .get
        }
    }
    
    // API 요청 헤더
    public var headers: [String: String] {
        switch self {
//        case let .getMsrstnList(sid):
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

        case let .getMsrstnAcctoRDyrg(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                "numOfRows" : "100",
                "pageNo" : "1",
                "inqBginDt" : "20240204",
                "inqEndDt" : "20240206"
                
            ]
            
        case let .getMsrstnAcctoRMmrg(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                "numOfRows" : "100",
                "pageNo" : "1",
                "inqBginMm" : "202311",
                "inqEndMm" : "202401"
            ]
            
        case let .getCtprvnMesureLIst(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                "numOfRows" : "100",
                "pageNo" : "1",
                "itemCode" : "PM10",
                "dataGubun" : "HOUR",
                "searchCondition" : "WEEK"

            ]
        }
    }
    
    // 인코딩 방식
    // 파라미터로 보내야할 것이 있다면, URLEncoding.default
    // 바디에 담아서 보내야할 것이 있다면, JSONEncoding.default
    public var encoding: ParameterEncoding? {
        switch self {
        case .getMsrstnAcctoRDyrg,
                .getMsrstnAcctoRMmrg,
                .getCtprvnMesureLIst:
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

//출처: https://jkim68888.tistory.com/18 [Jihyun Kim:티스토리]
