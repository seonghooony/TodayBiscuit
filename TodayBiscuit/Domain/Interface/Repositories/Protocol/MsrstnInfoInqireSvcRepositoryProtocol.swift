//
//  MsrstnInfoInqireSvcRepositoryProtocol.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift

protocol MsrstnInfoInqireSvcRepositoryProtocol {
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getMsrstnList(sid: String) -> Observable<MIISBaseResponse<MsrstnListItem>>
    /// 근접측정소 목록 조회
    func getNearbyMsrstnList(sid: String) -> Observable<MIISBaseResponse<NearbyMsrstnListItem>>
    /// TM 기준좌표 조회
    func getTMStdrCrdnt(sid: String) -> Observable<MIISBaseResponse<TMStdrCrdntItem>>
}
