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
    func getMsrstnList(numOfRows: String?,
                       pageNo: String?,
                       addr: String?,
                       stationName: String?) -> Observable<MIISBaseResponse<MsrstnListItem>>
    
    /// 근접측정소 목록 조회
    func getNearbyMsrstnList(tmX: String?,
                             tmY: String?) -> Observable<MIISBaseResponse<NearbyMsrstnListItem>>
    
    /// TM 기준좌표 조회
    func getTMStdrCrdnt(numOfRows: String?,
                        pageNo: String?,
                        umdName: String?) -> Observable<MIISBaseResponse<TMStdrCrdntItem>>
}

// 파라미터에 기본 nil 값을 사용 가능하게끔하기 위해 extension
extension MsrstnInfoInqireSvcRepositoryProtocol {
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getMsrstnList(numOfRows: String? = nil,
                       pageNo: String? = nil,
                       addr: String? = nil,
                       stationName: String? = nil) -> Observable<MIISBaseResponse<MsrstnListItem>> {
        getMsrstnList(numOfRows: numOfRows, pageNo: pageNo, addr: addr, stationName: stationName)
    }
    
    /// 근접측정소 목록 조회
    func getNearbyMsrstnList(tmX: String? = nil,
                             tmY: String? = nil) -> Observable<MIISBaseResponse<NearbyMsrstnListItem>> {
        getNearbyMsrstnList(tmX: tmX, tmY: tmY)
    }
    
    /// TM 기준좌표 조회
    func getTMStdrCrdnt(numOfRows: String? = nil,
                        pageNo: String? = nil,
                        umdName: String? = nil) -> Observable<MIISBaseResponse<TMStdrCrdntItem>> {
        getTMStdrCrdnt(numOfRows: numOfRows, pageNo: pageNo, umdName: umdName)
    }
}

// https://eunjin3786.tistory.com/207
// defaultRepository의 프로토콜이라 보면됨
