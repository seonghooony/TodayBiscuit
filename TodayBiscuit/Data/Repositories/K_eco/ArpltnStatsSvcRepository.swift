//
//  ArpltnStatsSvcRepository.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift

final class ArpltnStatsSvcRepository {
    
    private var disposeBag = DisposeBag()
    
    private let arpltnStatsSvcService: ArpltnStatsSvcService
    
    init(arpltnStatsSvcService: ArpltnStatsSvcService) {
        self.arpltnStatsSvcService = arpltnStatsSvcService
    }
    
}

extension ArpltnStatsSvcRepository: ArpltnStatsSvcRepositoryProtocol {
    
    /// 측정소별 실시간 일평균 정보 조회
    func getMsrstnAcctoRDyrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginDt: String? = nil,
                             inqEndDt: String? = nil,
                             msrstnName: String? = nil) -> Observable<ASSBaseResponse<MsrstnAcctoRDyrgItem>> {
        
        let observable = Observable<ASSBaseResponse<MsrstnAcctoRDyrgItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnStatsSvcService.getMsrstnAcctoRDyrg(numOfRows: numOfRows,
                                                           pageNo: pageNo,
                                                           inqBginDt: inqBginDt, 
                                                           inqEndDt: inqEndDt,
                                                           msrstnName: msrstnName)
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
    
    /// 측정소별 실시간 월평균 정보 조회
    func getMsrstnAcctoRMmrg(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             inqBginMm: String? = nil,
                             inqEndMm: String? = nil,
                             msrstnName: String? = nil) -> Observable<ASSBaseResponse<MsrstnAcctoRMmrgItem>> {

        let observable = Observable<ASSBaseResponse<MsrstnAcctoRMmrgItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnStatsSvcService.getMsrstnAcctoRMmrg(numOfRows: numOfRows, 
                                                           pageNo: pageNo,
                                                           inqBginMm: inqBginMm,
                                                           inqEndMm: inqEndMm,
                                                           msrstnName: msrstnName)
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
    
    
    /// 시도별 실시간 평균정보 조회
    func getCtprvnMesureLIst(numOfRows: String? = nil,
                             pageNo: String? = nil,
                             itemCode: String? = nil,
                             dataGubun: String? = nil,
                             searchCondition: String? = nil) -> Observable<ASSBaseResponse<CtprvnMesureLIstItem>> {
        
        let observable = Observable<ASSBaseResponse<CtprvnMesureLIstItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnStatsSvcService.getCtprvnMesureLIst(numOfRows: numOfRows,
                                                           pageNo: pageNo,
                                                           itemCode: itemCode,
                                                           dataGubun: dataGubun,
                                                           searchCondition: searchCondition)
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
