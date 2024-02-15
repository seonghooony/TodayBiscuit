//
//  ArpltnStatsSvcRepositoryProtocol.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift
    
protocol ArpltnStatsSvcRepositoryProtocol {
    /// 측정소별 실시간 일평균 정보 조회
    func getMsrstnAcctoRDyrg() -> Observable<ASSBaseResponse<MsrstnAcctoRDyrgItem>>
    /// 측정소별 실시간 월평균 정보 조회
    func getMsrstnAcctoRMmrg() -> Observable<ASSBaseResponse<MsrstnAcctoRMmrgItem>>
    /// 시도별 실시간 평균정보 조회
    func getCtprvnMesureLIst() -> Observable<ASSBaseResponse<CtprvnMesureLIstItem>>
    
}

// https://eunjin3786.tistory.com/207
// defaultRepository의 프로토콜이라 보면됨
