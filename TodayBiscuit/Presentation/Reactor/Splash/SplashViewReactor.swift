//
//  SplashViewReactor.swift
//  TodayBiscuit
//
//  Created by SeongHoon Kim on 12/2/23.
//

import ReactorKit
import RxCocoa

// ExampleViewController의 VM 과 같음
class SplashViewReactor: Reactor {
    
    var disposeBag = DisposeBag()
    
    
    let initialState: State
    
    var splashUseCase: SplashUseCaseProtocol?
    
    init() {
        Log.debug("SplashViewReactor init")
        self.initialState = State()
        
        self.splashUseCase = DIContainer.shared.container.resolve(SplashUseCaseProtocol.self)
    }
    
    deinit {
        Log.debug("SplashViewReactor deinit")
        disposeBag = DisposeBag()
    }
    
    enum Action {
        case loadKecoData
        
    }
    
    enum Mutation {
        case setMinuDustFrcstDspthItemList([MinuDustFrcstDspthItem]?)
        case showError
        
    }
    
    struct State {
        var minuDustFrcstDspthItemList: [MinuDustFrcstDspthItem] = []
    }
    
    
    func mutate(action: Action) -> Observable<Mutation> {
        
        guard let splashUseCase = splashUseCase else { return .never() }
        
        switch action {
        case .loadKecoData:
            
            return Observable.concat([
                splashUseCase.getAIISMinuDustFrcstDspth(searchDate: "2024-02-06")
                    .map{ minuDustFrcstDspthItemList in
                        
                        return Mutation.setMinuDustFrcstDspthItemList(minuDustFrcstDspthItemList)
                    }
                    .catchAndReturn(Mutation.showError),
                
            
            ])

        }
        
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        
        
        switch mutation {
        case .setMinuDustFrcstDspthItemList(let minuDustFrcstDspthItemList):
            if let minuDustFrcstDspthItemList = minuDustFrcstDspthItemList {
                newState.minuDustFrcstDspthItemList = minuDustFrcstDspthItemList
            }
            
        default:
            break
            
        }
        
        return newState
    }
}
