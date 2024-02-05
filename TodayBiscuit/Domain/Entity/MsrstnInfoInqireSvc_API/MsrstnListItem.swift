//
//  MsrstnListItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/5/24.
//

import Foundation

/// 측정소 주소 또는 측정소 명칭으로 검색하여 측정소 목록 또는 단 건의 측정소 상세 정보 조회 기능 제공
struct MsrstnListItem: Codable {
    /// 측정소명
    let stationName: String?
    /// 측정소 주소
    let addr: String?
    /// 설치년도
    let year: String?
    /// 측정망
    let mangName: String?
    /// 측정항목
    let item: String?
    /// WGS84 기반 X좌표
    let dmX: String?
    /// WGS84 기반 Y좌표
    let dmY: String?
}
