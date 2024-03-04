//
//  ArpltnInforInqireSvcRepositoryProtocol.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation
import RxSwift

protocol ArpltnInforInqireSvcRepositoryProtocol {
    /// 대기질예보통보조회
    func getMinuDustFrcstDspth(numOfRows: String?,
                               pageNo: String?,
                               searchDate: String?,
                               InformCode: String?) -> Observable<AIISBaseResponse<MinuDustFrcstDspthItem>>
    /// 초미세먼지주간예보조회(안쓸예정)
    func getMinuDustWeekFrcstDspth(numOfRows: String?,
                                   pageNo: String?,
                                   searchDate: String?) -> Observable<AIISBaseResponse<MinuDustWeekFrcstDspthItem>>
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getMsrstnAcctoRltmMesureDnsty(numOfRows: String?,
                                       pageNo: String?,
                                       stationName: String?,
                                       dataTerm: String?) -> Observable<AIISBaseResponse<CtprvnRltmMesureDnstyItem>>
    /// 통합대기환경지수 나쁨 이상 측정소 목록조회(안쓸예정)
    func getUnityAirEnvrnIdexSnstiveAboveMsrstnList(numOfRows: String?,
                                                    pageNo: String?) -> Observable<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>>
    /// 시도별 실시간 측정정보 조회 (지도메인)
    func getCtprvnRltmMesureDnsty(numOfRows: String?,
                                  pageNo: String?,
                                  sidoName: String?) -> Observable<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>>
    
}

// 파라미터에 기본 nil 값을 사용 가능하게끔하기 위해 extension
extension ArpltnInforInqireSvcRepositoryProtocol {
    /// 대기질예보통보조회
    func getMinuDustFrcstDspth(numOfRows: String? = nil,
                               pageNo: String? = nil,
                               searchDate: String? = nil,
                               InformCode: String? = nil) -> Observable<AIISBaseResponse<MinuDustFrcstDspthItem>> {
        getMinuDustFrcstDspth(numOfRows: numOfRows, pageNo: pageNo, searchDate: searchDate, InformCode: InformCode)
    }
    
    /// 초미세먼지주간예보조회(안쓸예정)
    func getMinuDustWeekFrcstDspth(numOfRows: String? = nil,
                                   pageNo: String? = nil,
                                   searchDate: String? = nil) -> Observable<AIISBaseResponse<MinuDustWeekFrcstDspthItem>> {
        getMinuDustWeekFrcstDspth(numOfRows: numOfRows, pageNo: pageNo, searchDate: searchDate)
    }
    
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getMsrstnAcctoRltmMesureDnsty(numOfRows: String? = nil,
                                       pageNo: String? = nil,
                                       stationName: String? = nil,
                                       dataTerm: String? = nil) -> Observable<AIISBaseResponse<CtprvnRltmMesureDnstyItem>> {
        getMsrstnAcctoRltmMesureDnsty(numOfRows: numOfRows, pageNo: pageNo, stationName: stationName, dataTerm: dataTerm)
    }
    
    /// 통합대기환경지수 나쁨 이상 측정소 목록조회(안쓸예정)
    func getUnityAirEnvrnIdexSnstiveAboveMsrstnList(numOfRows: String? = nil,
                                                    pageNo: String? = nil) -> Observable<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>> {
        getUnityAirEnvrnIdexSnstiveAboveMsrstnList(numOfRows: numOfRows, pageNo: pageNo)
    }
    
    /// 시도별 실시간 측정정보 조회 (지도메인)
    func getCtprvnRltmMesureDnsty(numOfRows: String? = nil,
                                  pageNo: String? = nil,
                                  sidoName: String? = nil) -> Observable<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>> {
        getCtprvnRltmMesureDnsty(numOfRows: numOfRows, pageNo: pageNo, sidoName: sidoName)
    }
}

// https://eunjin3786.tistory.com/207
// defaultRepository의 프로토콜이라 보면됨
// https://minsone.github.io/programming/swift-protocol-function-default-value
