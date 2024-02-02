//
//  MinuDustFrcstDspthData.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/2/24.
//

import Foundation

struct MinuDustFrcstDspthData: Codable {
    /**
     통보시간
     
     결과값 예시 : 2020-11-13 11시 발표
     */
    let dataTime: String?
    /**
     예측통보시간
     
     결과값 예시 : 2020-11-14
     */
    let informData: String?
    /**
     통보코드
     
     결과값 예시 : PM10
     */
    let informCode: String?
    /**
     예보개황
     
     결과값 예시 : ○[미세먼지] 수도권ㆍ강원영서...
     */
    let infornOverall: String?
    /**
     발생원인
     
     결과값 예시 : ○[미세먼지] 황사의 영향으로...
     */
    let informCause: String?
    /**
     예보등급
     
     결과값 예시 : 서울: 나쁨, 제주: 나쁨, 전남: 나쁨...
     */
    let informGrade: String?
    /**
     행동요령
     
     결과값 예시 :
     */
    let actionKnack: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl1: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl2: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl3: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl4: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl5: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl6: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl7: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl8: String?
    /**
     시간대별 예측모델 결과사진(6:00, 12:00, 18:00, 24:00 KST)
     
     결과값 예시 : https://www.airkorea.or.kr/dustImage/..
     */
    let imageUrl9: String?
}

//공공데이터포털
//https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15073861
