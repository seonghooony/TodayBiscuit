//
//  ArpltnInforInqireSvcRepository.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift

final class ArpltnInforInqireSvcRepository {
    
    private var disposeBag = DisposeBag()
    
    private let arpltnInforInqireSvcService: ArpltnInforInqireSvcService
    
    init(arpltnInforInqireSvcService: ArpltnInforInqireSvcService) {
        self.arpltnInforInqireSvcService = arpltnInforInqireSvcService
    }
}

/// 한국환경공단 에어코리아 대기오염정보
extension ArpltnInforInqireSvcRepository: ArpltnInforInqireSvcRepositoryProtocol {
    
    /// 대기질예보통보조회
    func getMinuDustFrcstDspth(numOfRows: String? = nil,
                               pageNo: String? = nil,
                               searchDate: String? = nil,
                               InformCode: String? = nil) -> Observable<AIISBaseResponse<MinuDustFrcstDspthItem>> {
        
        let observable = Observable<AIISBaseResponse<MinuDustFrcstDspthItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getMinuDustFrcstDspth(numOfRows: numOfRows,
                                                                   pageNo: pageNo,
                                                                   searchDate: searchDate,
                                                                   InformCode: InformCode)
            .subscribe (onNext: { result in
                switch result {
                case let .success(result):
                    observer.onNext(result)
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                }
            })
            .disposed(by: self.disposeBag)
            return Disposables.create()
        }
        return observable
    }
    
    /// 초미세먼지주간예보조회(안쓸예정)
    func getMinuDustWeekFrcstDspth(numOfRows: String? = nil,
                                   pageNo: String? = nil,
                                   searchDate: String? = nil) -> Observable<AIISBaseResponse<MinuDustWeekFrcstDspthItem>> {
        
        let observable = Observable<AIISBaseResponse<MinuDustWeekFrcstDspthItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getMinuDustWeekFrcstDspth(numOfRows: numOfRows,
                                                                       pageNo: pageNo,
                                                                       searchDate: searchDate)
            .subscribe (onNext: { result in
                switch result {
                case let .success(result):
                    observer.onNext(result)
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                    observer.onCompleted()
                }
            })
            .disposed(by: self.disposeBag)
            return Disposables.create()
        }
        return observable
    }
    
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getMsrstnAcctoRltmMesureDnsty(numOfRows: String? = nil,
                                       pageNo: String? = nil,
                                       stationName: String? = nil,
                                       dataTerm: String? = nil) -> Observable<AIISBaseResponse<CtprvnRltmMesureDnstyItem>> {
        
        let observable = Observable<AIISBaseResponse<CtprvnRltmMesureDnstyItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getMsrstnAcctoRltmMesureDnsty(numOfRows: numOfRows,
                                                                           pageNo: pageNo,
                                                                           stationName: stationName,
                                                                           dataTerm: dataTerm)
            .subscribe (onNext: { result in
                switch result {
                case let .success(result):
                    observer.onNext(result)
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                    observer.onCompleted()
                }
            })
            .disposed(by: self.disposeBag)
            return Disposables.create()
        }
        return observable
    }
    
    /// 통합대기환경지수 나쁨 이상 측정소 목록조회(안쓸예정)
    func getUnityAirEnvrnIdexSnstiveAboveMsrstnList(numOfRows: String? = nil,
                                                    pageNo: String? = nil) -> Observable<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>> {
        
        let observable = Observable<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getUnityAirEnvrnIdexSnstiveAboveMsrstnList(numOfRows: numOfRows,
                                                                                        pageNo: pageNo)
            .subscribe (onNext: { result in
                switch result {
                case let .success(result):
                    observer.onNext(result)
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                    observer.onCompleted()
                }
            })
            .disposed(by: self.disposeBag)
            return Disposables.create()
        }
        return observable
    }
    
    /// 시도별 실시간 측정정보 조회 (지도메인)
    func getCtprvnRltmMesureDnsty(numOfRows: String? = nil,
                                  pageNo: String? = nil,
                                  sidoName: String? = nil) -> Observable<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>> {
        
        let observable = Observable<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getCtprvnRltmMesureDnsty(numOfRows: numOfRows,
                                                                      pageNo: pageNo,
                                                                      sidoName: sidoName)
            .subscribe (onNext: { result in
                switch result {
                case let .success(result):
                    observer.onNext(result)
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                    observer.onCompleted()
                }
            })
            .disposed(by: self.disposeBag)
            return Disposables.create()
        }
        return observable
    }
    
    
}
