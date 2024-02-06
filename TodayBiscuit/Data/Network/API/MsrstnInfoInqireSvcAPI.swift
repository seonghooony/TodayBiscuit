//
//  MsrstnInfoInqireSvcAPI.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
import Alamofire


public enum MsrstnInfoInqireSvcAPI {
    /// 측정소별 실시간 측정정보 조회(주 메인)
    case getMsrstnList(sid: String)
    /// 근접측정소 목록 조회
    case getNearbyMsrstnList(sid: String)
    /// TM 기준좌표 조회
    case getTMStdrCrdnt(sid: String)
}

extension MsrstnInfoInqireSvcAPI: BaseAPIRouter, URLRequestConvertible {
    // Base Url
    public var baseURL: String {
        return "http://apis.data.go.kr/B552584/MsrstnInfoInqireSvc"
    }
    
    // Base Url 뒤에 붙는 path
    public var path: String {
        switch self {
        case .getMsrstnList:
            return "/getMsrstnList"
        case .getNearbyMsrstnList:
            return "/getNearbyMsrstnList"
        case .getTMStdrCrdnt:
            return "/getTMStdrCrdnt"


        }
    }
    
    // API 요청 방식
    public var method: HTTPMethod {
        switch self {
        case .getMsrstnList,
                .getNearbyMsrstnList,
                .getTMStdrCrdnt:
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

        case let .getMsrstnList(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                "numOfRows" : "9999",
                "pageNo" : "1",
                //"addr" : "서울"
                //"stationName" : "종로구"
                "ver" : "1.0"
            ]
            
        case let .getNearbyMsrstnList(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
                "tmX" : "244148.546388",
                "tmY" : "412423.75772",
                "ver" : "1.1"
            ]
            
        case let .getTMStdrCrdnt(sid):
            return [
                "serviceKey" : sid,
                "returnType" : "json",
//                "numOfRows" : "9999",
//                "pageNo" : "1",
                "umdName" : "혜화동"
            ]
        }
    }
    
    // 인코딩 방식
    // 파라미터로 보내야할 것이 있다면, URLEncoding.default
    // 바디에 담아서 보내야할 것이 있다면, JSONEncoding.default
    public var encoding: ParameterEncoding? {
        switch self {
        case .getMsrstnList,
                .getNearbyMsrstnList,
                .getTMStdrCrdnt:
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
