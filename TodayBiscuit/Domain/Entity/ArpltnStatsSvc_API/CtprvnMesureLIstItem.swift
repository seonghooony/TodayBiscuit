//
//  CtprvnMesureLIstItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

/// 시도별 측정소목록에 대한 일반 항목의 시간 및 일평균 자료 및 지역 평균정보를 제공하는 시도별 실시간 평균정보 조회
struct CtprvnMesureLIstItem: Codable {
    /// 측정일시 2020-11-13 11:00
    let dataTime: String?
    /// 조회항목 구분(SO2, CO, O3, NO2, PM10, PM2.5)
    let itemCode: String?
    /// 조회 자료 구분(시간평균, 일평균)
    let dataGubun: String?
    /// 서울
    let seoul: String?
    /// 부산
    let busan: String?
    /// 대구
    let daegu: String?
    /// 인천
    let incheon: String?
    /// 광주
    let gwangju: String?
    /// 대전
    let daejeon: String?
    /// 울산
    let ulsan: String?
    /// 경기
    let gyeonggi: String?
    /// 강원
    let gangwon: String?
    /// 충북
    let chungbuk: String?
    /// 충남
    let chungnam: String?
    /// 전북
    let jeonbuk: String?
    /// 전남
    let jeonnam: String?
    /// 경북
    let gyeongbuk: String?
    /// 경남
    let gyeongnam: String?
    /// 제주
    let jeju: String?
    /// 세종
    let sejong: String?
    
}
