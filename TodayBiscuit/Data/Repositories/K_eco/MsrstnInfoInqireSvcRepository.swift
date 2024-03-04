//
//  MsrstnInfoInqireSvcRepository.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/6/24.
//

import Foundation

import RxSwift

final class MsrstnInfoInqireSvcRepository {
    
    private var disposeBag = DisposeBag()
    
    private let msrstnInfoInqireSvcService: MsrstnInfoInqireSvcService
    
    init(msrstnInfoInqireSvcService: MsrstnInfoInqireSvcService) {
        self.msrstnInfoInqireSvcService = msrstnInfoInqireSvcService
    }
    
}

extension MsrstnInfoInqireSvcRepository: MsrstnInfoInqireSvcRepositoryProtocol {
    /// 측정소별 실시간 측정정보 조회(주 메인)
    func getMsrstnList(numOfRows: String? = nil,
                       pageNo: String? = nil,
                       addr: String? = nil,
                       stationName: String? = nil) -> Observable<MIISBaseResponse<MsrstnListItem>> {
        
        let observable = Observable<MIISBaseResponse<MsrstnListItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.msrstnInfoInqireSvcService.getMsrstnList(numOfRows: numOfRows, 
                                                          pageNo: pageNo,
                                                          addr: addr,
                                                          stationName: stationName)
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
    
    
    /// 근접측정소 목록 조회
    func getNearbyMsrstnList(tmX: String? = nil,
                             tmY: String? = nil) -> Observable<MIISBaseResponse<NearbyMsrstnListItem>> {
        
        let observable = Observable<MIISBaseResponse<NearbyMsrstnListItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.msrstnInfoInqireSvcService.getNearbyMsrstnList(tmX: tmX,
                                                                tmY: tmY)
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
    
    
    /// TM 기준좌표 조회
    func getTMStdrCrdnt(numOfRows: String? = nil,
                        pageNo: String? = nil,
                        umdName: String? = nil) -> Observable<MIISBaseResponse<TMStdrCrdntItem>> {
        
        let observable = Observable<MIISBaseResponse<TMStdrCrdntItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.msrstnInfoInqireSvcService.getTMStdrCrdnt(numOfRows: numOfRows,
                                                           pageNo: pageNo,
                                                           umdName: umdName)
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
