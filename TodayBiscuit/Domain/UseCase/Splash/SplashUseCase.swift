//
//  SplashUseCase.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/13/24.
//

import Foundation

import RxSwift
import RxCocoa

protocol SplashUseCaseProtocol {
    
    func getAIISMinuDustFrcstDspth() -> Observable<[MinuDustFrcstDspthItem]?>
    
}

final class SplashUseCase: SplashUseCaseProtocol {
    
    var disposeBag = DisposeBag()
    
    let arpltnInforInqireSvcRepository: ArpltnInforInqireSvcRepositoryProtocol
    let msrstnInfoInqireSvcRepository: MsrstnInfoInqireSvcRepositoryProtocol
    let arpltnStatsSvcRepository: ArpltnStatsSvcRepositoryProtocol
    
    init(
        arpltnInforInqireSvcRepository: ArpltnInforInqireSvcRepositoryProtocol,
        msrstnInfoInqireSvcRepository: MsrstnInfoInqireSvcRepositoryProtocol,
        arpltnStatsSvcRepository: ArpltnStatsSvcRepositoryProtocol) {
        Log.debug("SplashUseCase ₩init")
        
            self.arpltnInforInqireSvcRepository = arpltnInforInqireSvcRepository
            self.msrstnInfoInqireSvcRepository = msrstnInfoInqireSvcRepository
            self.arpltnStatsSvcRepository = arpltnStatsSvcRepository
    }
    
    deinit {
        disposeBag = DisposeBag()
        Log.debug("SplashUseCase deinit")
    }
    
    func getAIISMinuDustFrcstDspth() -> Observable<[MinuDustFrcstDspthItem]?> {
        arpltnInforInqireSvcRepository.getMinuDustFrcstDspth()
            .map { AIISBaseResponse in
                
                return AIISBaseResponse.response?.body?.items
            }
            .catch { error in
                
                return .never()
            }
    }
}
