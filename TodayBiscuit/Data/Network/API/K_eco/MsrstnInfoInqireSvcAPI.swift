//
//  MsrstnInfoInqireSvcAPI.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
import Alamofire

/// 한국환경공단 에어코리아 측정소정보
public enum MsrstnInfoInqireSvcAPI {
    /// 측정소별 실시간 측정정보 조회(주 메인)
    case getMsrstnList(numOfRows: String? = nil,
                       pageNo: String? = nil,
                       addr: String? = nil,
                       stationName: String? = nil)
    
    /// 근접측정소 목록 조회
    case getNearbyMsrstnList(tmX: String? = nil,
                             tmY: String? = nil)
    
    /// TM 기준좌표 조회
    case getTMStdrCrdnt(numOfRows: String? = nil,
                        pageNo: String? = nil,
                        umdName: String? = nil)
}

extension MsrstnInfoInqireSvcAPI: BaseAPIRouter, URLRequestConvertible {
    /// Base Url
    public var baseURL: String {
        return "http://apis.data.go.kr/B552584/MsrstnInfoInqireSvc"
    }
    
    /// Base Url 뒤에 붙는 path
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
    
    /// API 요청 방식
    public var method: HTTPMethod {
        switch self {
        case .getMsrstnList,
                .getNearbyMsrstnList,
                .getTMStdrCrdnt:
            return .get
        }
    }
    
    /// API 요청 헤더
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
    
    /// 서버에 보낼 데이터
    public var parameters: [String: Any]? {
        
        var param: [String: Any] = [:]
        guard let sid = Bundle.main.KecoSvcKey_Decoding else {
            Log.network("K_eco API 키를 로드하지 못했습니다.")
            return nil
        }

        param["serviceKey"] = sid
        param["returnType"] = "json"
        
        
        switch self {
        case .getMsrstnList(let numOfRows,
                            let pageNo,
                            let addr,
                            let stationName):
            
            param["ver"] = "1.0"
            
            if let numOfRows = numOfRows {
                param["numOfRows"] = numOfRows
            }
            
            if let pageNo = pageNo {
                param["pageNo"] = pageNo
            }
            
            if let addr = addr {
                param["addr"] = addr
            }
            
            if let stationName = stationName {
                param["stationName"] = stationName
            }
            
            return param
            
//            return [
//                "serviceKey" : sid,
//                "returnType" : "json",
//                "numOfRows" : "9999",
//                "pageNo" : "1",
//                //"addr" : "서울"
//                //"stationName" : "종로구"
//                "ver" : "1.0"
//            ]
            
        case .getNearbyMsrstnList(let tmX,
                                  let tmY):
            
            param["ver"] = "1.1"
            
            if let tmX = tmX {
                param["tmX"] = tmX
            }
            
            if let tmY = tmY {
                param["tmY"] = tmY
            }
            
            return param
            
//            return [
//                "serviceKey" : sid,
//                "returnType" : "json",
//                "tmX" : "244148.546388",
//                "tmY" : "412423.75772",
//                "ver" : "1.1"
//            ]
            
        case .getTMStdrCrdnt(let numOfRows,
                             let pageNo,
                             let umdName):
            
            if let numOfRows = numOfRows {
                param["numOfRows"] = numOfRows
            }
            
            if let pageNo = pageNo {
                param["pageNo"] = pageNo
            }
            
            if let umdName = umdName {
                param["umdName"] = umdName
            }
            
            return param
            
//            return [
//                "serviceKey" : sid,
//                "returnType" : "json",
////                "numOfRows" : "9999",
////                "pageNo" : "1",
//                "umdName" : "혜화동"
//            ]
        }
    }
    
    /// 인코딩 방식
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
