//
//  UnityAirEnvrnIdexSnstiveAboveMsrstnListItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/5/24.
//

import Foundation

/// 통합대기환경지수가 나쁨 등급 이상인 측정소명과 주소 목록 정보를 제공하는 통합대기환경지수 나쁨 이상 측정소 목록조회
struct UnityAirEnvrnIdexSnstiveAboveMsrstnListItem: Codable {
    /// 측정소명
    let stationName: String?
    /// 측정소 주소
    let addr: String?
}
