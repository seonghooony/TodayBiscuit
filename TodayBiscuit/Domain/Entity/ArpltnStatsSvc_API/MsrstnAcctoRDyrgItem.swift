//
//  MsrstnAcctoRDyrgItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

/// 조회 기간 내 측정소별 실시간 일평균 정보를 조회(최종확정 이전 실시간 데이터만 제공, 최근 약 3~6개월 데이터)
struct MsrstnAcctoRDyrgItem: Codable {
    /// 측정일
    let msurDt: String?
    /// 측정소명
    let msrstnName: String?
    /// 아황산가스 평균농도
    let so2Value: String?
    /// 일산화탄소 평균농도
    let coValue: String?
    /// 오존 평균농도
    let o3Value: String?
    /// 이산화질소 평균농도
    let no2Value: String?
    /// 미세먼지 평균농도
    let pm10Value: String?
    /// 초미세먼지 평균농도
    let pm25Value: String?
}
