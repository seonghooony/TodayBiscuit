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
    func getMsrstnList(sid: String) -> Observable<MIISBaseResponse<MsrstnListItem>> {
        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<MIISBaseResponse<MsrstnListItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.msrstnInfoInqireSvcService.getMsrstnList(sid: sid).subscribe (onNext: { result in
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
    func getNearbyMsrstnList(sid: String) -> Observable<MIISBaseResponse<NearbyMsrstnListItem>> {
        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<MIISBaseResponse<NearbyMsrstnListItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.msrstnInfoInqireSvcService.getNearbyMsrstnList(sid: sid).subscribe (onNext: { result in
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
    func getTMStdrCrdnt(sid: String) -> Observable<MIISBaseResponse<TMStdrCrdntItem>> {
        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<MIISBaseResponse<TMStdrCrdntItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.msrstnInfoInqireSvcService.getTMStdrCrdnt(sid: sid).subscribe (onNext: { result in
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
