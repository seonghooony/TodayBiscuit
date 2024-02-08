//
//  APIEventLogger.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/8/24.
//

import Alamofire
import Foundation

class APIEventLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "NetworkLogger")
    
    func requestDidResume(_ request: Request) {
        Log.network(
            "----------------------------------------------------\n" +
            "              🛰 NETWORK Reqeust LOG\n" +
            "----------------------------------------------------")
        
        Log.network(
            "1️⃣ URL / Method / Header" + "\n" +
            "URL: " + (request.request?.url?.absoluteString ?? "")  + "\n" +
            "Method: " + (request.request?.httpMethod ?? "") + "\n" +
            "Headers: " + "\(request.request?.allHTTPHeaderFields ?? [:])")

        Log.network("2️⃣ Body")
        if let body = request.request?.httpBody?.toPrettyPrintedString {
            Log.network("Body: \(body)")
        } else {
            Log.network("보낸 Body가 없습니다.")
        }
        
    }
    
//    func requestDidFinish(_ request: Request) {
//        Log.network(
//            "----------------------------------------------------\n\n" +
//            "              🛰 NETWORK Reqeust LOG\n" +
//            "\n----------------------------------------------------")
//        
//        Log.network(
//            "1️⃣ URL / Method / Header" + "\n" +
//            "URL: " + (request.request?.url?.absoluteString ?? "")  + "\n" +
//            "Method: " + (request.request?.httpMethod ?? "") + "\n" +
//            "Headers: " + "\(request.request?.allHTTPHeaderFields ?? [:])")
//
//        Log.network("----------------------------------------------------\n2️⃣ Body")
//        if let body = request.request?.httpBody?.toPrettyPrintedString {
//            Log.network("Body: \(body)")
//        } else {
//            Log.network("보낸 Body가 없습니다.")
//        }
//        Log.network("----------------------------------------------------\n")
//    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        Log.network(
            "----------------------------------------------------\n" +
            "              🛰 NETWORK Response LOG \n" +
            "----------------------------------------------------")
        
        
        switch response.result {
            
        case .success(_):
            Log.network("3️⃣ 서버 연결 성공")
        case .failure(_):
            Log.network("3️⃣ 서버 연결 실패")
            Log.network("올바른 URL인지 확인해보세요.")
        }
        
        Log.network("StatusCode: " + "\(response.response?.statusCode ?? 0)")
        
//        Log.network("Result: " + "\(response.result)" + "\n"
//            + "StatusCode: " + "\(response.response?.statusCode ?? 0)"
//        )
        
        if let statusCode = response.response?.statusCode {
            switch statusCode {
            case 400..<500:
                Log.network("❗오류 발생 : RequestError\n" + "잘못된 요청입니다. request를 재작성 해주세요.")
            case 500:
                Log.network("❗오류 발생 : ServerError\n" + "Server에 문제가 발생했습니다.")
            default:
                break
            }
        }
        
        Log.network("4️⃣ Data 확인하기")
        if let response = response.data?.toPrettyPrintedString {
            Log.network(response)
        } else { 
            Log.network("❗데이터가 없거나, Encoding에 실패했습니다.")
        }
        
        Log.network("---------------🛰 NETWORK Finished -----------------")
    }
    
    func request(_ request: Request, didFailTask task: URLSessionTask, earlyWithError error: AFError) {
        Log.network("URLSessionTask가 Fail 했습니다.")
    }
    
    func request(_ request: Request, didFailToCreateURLRequestWithError error: AFError) {
        Log.network("URLRequest를 만들지 못했습니다.")
    }
    
    func requestDidCancel(_ request: Request) {
        Log.network("request가 cancel 되었습니다")
    }
}

// https://jazz-the-it.tistory.com/36
