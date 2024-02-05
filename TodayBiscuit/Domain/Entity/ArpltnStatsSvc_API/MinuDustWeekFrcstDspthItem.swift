//
//  MinuDustWeekFrcstDspthItem.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/2/24.
//

import Foundation

/// 통보코드와 통보시간으로 대기질 전망과 주간예보 정보를 조회하는 초미세먼지 주간예보통보 조회
struct MinuDustWeekFrcstDspthItem: Codable {
    /**
     첫째날예보
     
     서울: 낮음, 인천: 낮음, 경기북부...
     */
    let frcstOneCn: String?
    /**
     둘째날예보
     
     서울: 낮음, 인천: 낮음, 경기북부...
     */
    let frcstTwoCn: String?
    /**
     셋째날예보
     
     서울: 낮음, 인천: 낮음, 경기북부...
     */
    let frcstThreeCn: String?
    /**
     넷째날예보
     
     서울: 낮음, 인천: 낮음, 경기북부...
     */
    let frcstFourCn: String?
    /**
     발표일시
     
     2020-11-09
     */
    let presnatnDT: String?
    /**
     첫째날예보일시
     
     2020-11-12
     */
    let frcstOneDt: String?
    /**
     둘째날예보일시
     
     2020-11-13
     */
    let frcstTwoDt: String?
    /**
     셋째날예보일시
     
     2020-11-14
     */
    let frcstThreeDt: String?
    /**
     넷째날예보일시
     
     2020-11-15
     */
    let frcstFourDt: String?
}

//공공데이터포털
//https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15073861
