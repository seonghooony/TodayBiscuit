//
//  MsrstnAcctoRltmMesureDnstyItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/5/24.
//

import Foundation
/// 측정소명과 측정데이터 기간(일,한달,3개월)으로 해당 측정소의 일반항목 측정정보를 제공하는 측정소별 실시간 측정정보조회
struct MsrstnAcctoRltmMesureDnstyItem: Codable {
    /// 측정일
    let dataTime: String?
    /// 측정망 정보
    let mangName: String?
    /// 아황산가스 농도
    let so2Value: String?
    /// 일산화탄소 농도
    let coValue: String?
    /// 오존 농도
    let o3Value: String?
    /// 이산화질소 농도
    let no2Value: String?
    /// 미세먼지(PM10) 농도
    let pm10Value: String?
    /// 미세먼지(PM10) 24시간 예측이동농도
    let pm10Value24: String?
    /// 초미세먼지(PM2.5) 농도
    let pm25Value: String?
    /// 초미세먼지(PM2.5) 24시간 예측이동농도
    let pm25Value24: String?
    /// 통합대기환경수치
    let khaiValue: String?
    /// 통합대기환경지수
    let khaiGrade: String?
    /// 아황산가스 지수
    let so2Grade: String?
    /// 일산화탄소 지수
    let coGrade: String?
    /// 오존 지수
    let o3Grade: String?
    /// 이산화질소 지수
    let no2Grade: String?
    /// 미세먼지(PM10) 24시간 등급
    let pm10Grade: String?
    /// 초미세먼지(PM2.5) 24시간 등급
    let pm25Grade: String?
    /// 미세먼지(PM10) 1시간 등급
    let pm10Grade1h: String?
    /// 초미세먼지(PM2.5) 1시간 등급
    let pm25Grade1h: String?
    /// 아황산가스 플래그
    let so2Flag: String?
    /// 일산화탄소 플래그
    let coFlag: String?
    /// 오존 플래그
    let o3Flag: String?
    /// 이산화질소 플래그
    let no2Flag: String?
    /// 미세먼지(PM10) 플래그
    let pm10Flag: String?
    /// 초미세먼지(PM2.5) 플래그
    let pm25Flag: String?
    
}

//공공데이터포털
//https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15073861
