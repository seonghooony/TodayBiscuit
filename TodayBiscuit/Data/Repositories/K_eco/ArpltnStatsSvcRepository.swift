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
    func getMsrstnAcctoRDyrg(sid: String) -> Observable<ASSBaseResponse<MsrstnAcctoRDyrgItem>> {
        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<ASSBaseResponse<MsrstnAcctoRDyrgItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnStatsSvcService.getMsrstnAcctoRDyrg(sid: sid).subscribe (onNext: { result in
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
    func getMsrstnAcctoRMmrg(sid: String) -> Observable<ASSBaseResponse<MsrstnAcctoRMmrgItem>> {
//        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<ASSBaseResponse<MsrstnAcctoRMmrgItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnStatsSvcService.getMsrstnAcctoRMmrg(sid: sid).subscribe (onNext: { result in
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
    func getCtprvnMesureLIst(sid: String) -> Observable<ASSBaseResponse<CtprvnMesureLIstItem>> {
        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<ASSBaseResponse<CtprvnMesureLIstItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnStatsSvcService.getCtprvnMesureLIst(sid: sid).subscribe (onNext: { result in
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
