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
    
    func getAIISMinuDustFrcstDspth(numOfRows: String?,
                                   pageNo: String?,
                                   searchDate: String?,
                                   InformCode: String?) -> Observable<[MinuDustFrcstDspthItem]?>
    
}

extension SplashUseCaseProtocol {
    func getAIISMinuDustFrcstDspth(numOfRows: String? = nil,
                                   pageNo: String? = nil,
                                   searchDate: String? = nil,
                                  InformCode: String? = nil) -> Observable<[MinuDustFrcstDspthItem]?> {
        getAIISMinuDustFrcstDspth(numOfRows: numOfRows, pageNo: pageNo, searchDate: searchDate, InformCode: InformCode)
    }
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
    
    func getAIISMinuDustFrcstDspth(numOfRows: String? = nil,
                                   pageNo: String? = nil,
                                   searchDate: String? = nil,
                                   InformCode: String? = nil) -> Observable<[MinuDustFrcstDspthItem]?> {
        arpltnInforInqireSvcRepository.getMinuDustFrcstDspth(numOfRows: numOfRows,
                                                             pageNo: pageNo,
                                                             searchDate: searchDate,
                                                             InformCode: InformCode)
            .map { AIISBaseResponse in
                
                return AIISBaseResponse.response?.body?.items
            }
            .catch { error in
                
                return .never()
            }
    }
}
