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
    func getMinuDustFrcstDspth() -> Observable<AIISBaseResponse<MinuDustFrcstDspthItem>>
    /// 초미세먼지주간예보조회(안쓸예정)
    func getMinuDustWeekFrcstDspth() -> Observable<AIISBaseResponse<MinuDustWeekFrcstDspthItem>>
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getCtprvnRltmMesureDnsty() -> Observable<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>>
    /// 통합대기환경지수 나쁨 이상 측정소 목록조회(안쓸예정)
    func getUnityAirEnvrnIdexSnstiveAboveMsrstnList() -> Observable<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>>
    /// 시도별 실시간 측정정보 조회 (지도메인)
    func getMsrstnAcctoRltmMesureDnsty() -> Observable<AIISBaseResponse<CtprvnRltmMesureDnstyItem>>
    
}

// https://eunjin3786.tistory.com/207
// defaultRepository의 프로토콜이라 보면됨
