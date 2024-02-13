//
//  ASSBaseResponse.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//


import Foundation

/// 한국환경공단_에어코리아_대기오염통계 현황
struct ASSBaseResponse<T: Codable>: Codable {
    let response: Response?

    enum CodingKeys: String, CodingKey {
        case response
    }
    
    struct Response: Codable {
        let header: Header?
        let body: Body?
        
        enum CodingKeys: String, CodingKey {
            case header
            case body
        }
        
        // MARK: - Header
        struct Header: Codable {
            let resultCode, resultMsg: String?
            
            enum CodingKeys: String, CodingKey {
                case resultCode
                case resultMsg
            }
        }
        
        // MARK: - Body
        struct Body: Codable {
            let items: [T]?
            let numOfRows, pageNo, totalCount: Int?
            
            enum CodingKeys: String, CodingKey {
                case items
                case numOfRows
                case pageNo
                case totalCount
            }
        }

        
    }
}

//https://www.data.go.kr/iim/api/selectAPIAcountView.do
