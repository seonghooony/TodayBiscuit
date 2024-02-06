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

extension ArpltnInforInqireSvcRepository: ArpltnInforInqireSvcRepositoryProtocol {
    
    /// 대기질예보통보조회
    func getMinuDustFrcstDspth(sid: String) -> Observable<AIISBaseResponse<MinuDustFrcstDspthItem>> {
//        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        print("getMinuDustFrcstDspth11")
        let observable = Observable<AIISBaseResponse<MinuDustFrcstDspthItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            print("getMinuDustFrcstDspth11-2")
            self.arpltnInforInqireSvcService.getMinuDustFrcstDspth(sid: sid).subscribe (onNext: { result in
                print("####")
//                print(result)
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
    func getMinuDustWeekFrcstDspth(sid: String) -> Observable<AIISBaseResponse<MinuDustWeekFrcstDspthItem>> {
//        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<AIISBaseResponse<MinuDustWeekFrcstDspthItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getMinuDustWeekFrcstDspth(sid: sid).subscribe (onNext: { result in
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
    func getCtprvnRltmMesureDnsty(sid: String) -> Observable<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>> {
//        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<AIISBaseResponse<MsrstnAcctoRltmMesureDnstyItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getCtprvnRltmMesureDnsty(sid: sid).subscribe (onNext: { result in
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
    func getUnityAirEnvrnIdexSnstiveAboveMsrstnList(sid: String) -> Observable<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>> {
//        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<AIISBaseResponse<UnityAirEnvrnIdexSnstiveAboveMsrstnListItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getUnityAirEnvrnIdexSnstiveAboveMsrstnList(sid: sid).subscribe (onNext: { result in
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
    func getMsrstnAcctoRltmMesureDnsty(sid: String) -> Observable<AIISBaseResponse<CtprvnRltmMesureDnstyItem>> {
//        let sid = UserDefaults.standard.string(forKey: "sid") ?? ""
        let observable = Observable<AIISBaseResponse<CtprvnRltmMesureDnstyItem>>.create { [weak self] observer -> Disposable in
            
            guard let self = self else { return Disposables.create() }
            
            self.arpltnInforInqireSvcService.getMsrstnAcctoRltmMesureDnsty(sid: sid).subscribe (onNext: { result in
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
