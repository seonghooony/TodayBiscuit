//
//  TMStdrCrdntItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/5/24.
//

import Foundation

/// TM 좌표를 알 수 없는 사용자를 위해 읍면동 이름으로 검색하여 TM기준좌표 내역을 조회하는 기능 제공
struct TMStdrCrdntItem: Codable {
    /// 시도
    let sidoName: String?
    /// 시군구
    let sggName: String?
    /// 읍면동
    let umdName: String?
    /// TM_X 좌표
    let tmX: String?
    /// TM_Y 좌표
    let tmY: String?
}

// https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15073877
