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
    func getMsrstnAcctoRDyrg(numOfRows: String?,
                             pageNo: String?,
                             inqBginDt: String?,
                             inqEndDt: String?,
                             msrstnName: String?) -> Observable<ASSBaseResponse<MsrstnAcctoRDyrgItem>>
    
    /// 측정소별 실시간 월평균 정보 조회
    func getMsrstnAcctoRMmrg(numOfRows: String?,
                             pageNo: String?,
                             inqBginMm: String?,
                             inqEndMm: String?,
                             msrstnName: String?) -> Observable<ASSBaseResponse<MsrstnAcctoRMmrgItem>>
    
    /// 시도별 실시간 평균정보 조회
    func getCtprvnMesureLIst(numOfRows: String?,
                             pageNo: String?,
                             itemCode: String?,
                             dataGubun: String?,
                             searchCondition: String?) -> Observable<ASSBaseResponse<CtprvnMesureLIstItem>>
    
}

extension ArpltnStatsSvcRepositoryProtocol {
    /// 측정소별 실시간 일평균 정보 조회
    func getMsrstnAcctoRDyrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginDt: String? = nil,
                             inqEndDt: String? = nil,
                             msrstnName: String? = nil) -> Observable<ASSBaseResponse<MsrstnAcctoRDyrgItem>> {
        getMsrstnAcctoRDyrg(numOfRows: numOfRows, pageNo: pageNo, inqBginDt: inqBginDt, inqEndDt: inqEndDt, msrstnName: msrstnName)
    }
    
    /// 측정소별 실시간 월평균 정보 조회
    func getMsrstnAcctoRMmrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginMm: String? = nil,
                             inqEndMm: String? = nil,
                             msrstnName: String? = nil) -> Observable<ASSBaseResponse<MsrstnAcctoRMmrgItem>> {
        getMsrstnAcctoRMmrg(numOfRows: numOfRows, pageNo: pageNo, inqBginMm: inqBginMm, inqEndMm: inqEndMm, msrstnName: msrstnName)
    }
    
    /// 시도별 실시간 평균정보 조회
    func getCtprvnMesureLIst(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             itemCode: String? = nil,
                             dataGubun: String? = nil,
                             searchCondition: String? = nil) -> Observable<ASSBaseResponse<CtprvnMesureLIstItem>> {
        getCtprvnMesureLIst(numOfRows: numOfRows, pageNo: pageNo, itemCode: itemCode, dataGubun: dataGubun, searchCondition: searchCondition)
    }
}

// https://eunjin3786.tistory.com/207
// defaultRepository의 프로토콜이라 보면됨
