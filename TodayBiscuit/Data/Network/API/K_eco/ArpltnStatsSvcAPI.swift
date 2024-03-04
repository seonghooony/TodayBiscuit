//
//  ArpltnStatsSvcAPI.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//


import Foundation

import RxSwift
import Alamofire

/// 한국환경공단 에어코리아 대기오염통계 현황
public enum ArpltnStatsSvcAPI {
    /// 측정소별 실시간 일평균 정보 조회
    case getMsrstnAcctoRDyrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginDt: String? = nil,
                             inqEndDt: String? = nil,
                             msrstnName: String? = nil)
    
    /// 측정소별 실시간 월평균 정보 조회
    case getMsrstnAcctoRMmrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginMm: String? = nil,
                             inqEndMm: String? = nil,
                             msrstnName: String? = nil)
    
    /// 시도별 실시간 평균정보 조회
    case getCtprvnMesureLIst(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             itemCode: String? = nil,
                             dataGubun: String? = nil,
                             searchCondition: String? = nil)
    /// 시군구별 실시간 평균정보 조회
    // 동작안해서 추가안함
}

extension ArpltnStatsSvcAPI: BaseAPIRouter, URLRequestConvertible {
    /// Base Url
    public var baseURL: String {
        return "http://apis.data.go.kr/B552584/ArpltnStatsSvc"
    }
    
    /// Base Url 뒤에 붙는 path
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
    
    /// API 요청 방식
    public var method: HTTPMethod {
        switch self {
        case .getMsrstnAcctoRDyrg,
                .getMsrstnAcctoRMmrg,
                .getCtprvnMesureLIst:
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

        case .getMsrstnAcctoRDyrg(let numOfRows,
                                  let pageNo,
                                  let inqBginDt,
                                  let inqEndDt,
                                  let msrstnName):
            
            if let numOfRows = numOfRows {
                param["numOfRows"] = numOfRows
            }
            
            if let pageNo = pageNo {
                param["pageNo"] = pageNo
            }
            
            if let inqBginDt = inqBginDt {
                param["inqBginDt"] = inqBginDt
            }
            
            if let inqEndDt = inqEndDt {
                param["inqEndDt"] = inqEndDt
            }
            
            if let msrstnName = msrstnName {
                param["msrstnName"] = msrstnName
            }
            
            return param
            
            
//            return [
//                "serviceKey" : sid,
//                "returnType" : "json",
//                "numOfRows" : "100",
//                "pageNo" : "1",
//                "inqBginDt" : "20240204",
//                "inqEndDt" : "20240206"
//                
//            ]
            
        case .getMsrstnAcctoRMmrg(let numOfRows,
                                  let pageNo,
                                  let inqBginMm,
                                  let inqEndMm,
                                  let msrstnName):
            
            if let numOfRows = numOfRows {
                param["numOfRows"] = numOfRows
            }
            
            if let pageNo = pageNo {
                param["pageNo"] = pageNo
            }
            
            if let inqBginMm = inqBginMm {
                param["inqBginMm"] = inqBginMm
            }
            
            if let inqEndMm = inqEndMm {
                param["inqEndMm"] = inqEndMm
            }
            
            if let msrstnName = msrstnName {
                param["msrstnName"] = msrstnName
            }
            
            return param
            
//            return [
//                "serviceKey" : sid,
//                "returnType" : "json",
//                "numOfRows" : "100",
//                "pageNo" : "1",
//                "inqBginMm" : "202311",
//                "inqEndMm" : "202401"
//            ]
            
        case .getCtprvnMesureLIst(let numOfRows,
                                  let pageNo,
                                  let itemCode,
                                  let dataGubun,
                                  let searchCondition):
            
            if let numOfRows = numOfRows {
                param["numOfRows"] = numOfRows
            }
            
            if let pageNo = pageNo {
                param["pageNo"] = pageNo
            }
            
            if let itemCode = itemCode {
                param["itemCode"] = itemCode
            }
            
            if let dataGubun = dataGubun {
                param["dataGubun"] = dataGubun
            }
            
            if let searchCondition = searchCondition {
                param["searchCondition"] = searchCondition
            }
            
            return param
            
//            return [
//                "serviceKey" : sid,
//                "returnType" : "json",
//                "numOfRows" : "100",
//                "pageNo" : "1",
//                "itemCode" : "PM10",
//                "dataGubun" : "HOUR",
//                "searchCondition" : "WEEK"
//
//            ]
        }
    }
    
    /// 인코딩 방식
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
