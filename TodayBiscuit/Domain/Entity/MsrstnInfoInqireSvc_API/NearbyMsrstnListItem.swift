//
//  NearbyMsrstnListItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/5/24.
//

import Foundation

/// TM 좌표를 입력하여 입력된 좌표 주변 측정소 정보와 입력 좌표와의 거리 조회 기능 제공
struct NearbyMsrstnListItem: Codable {
    /// 측정소 이름
    let stationName: String?
    /// 측정소가 위치한 주소
    let addr: String?
    /// 요청한 TM좌표와 측정소간의 거리(km단위)
    let tm: String?
    
}
