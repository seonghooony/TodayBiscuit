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
    
    
    
    init() {
        Log.debug("SplashViewReactor init")
        self.initialState = State()
        
    }
    
    deinit {
        Log.debug("SplashViewReactor deinit")
        disposeBag = DisposeBag()
    }
    
    enum Action {
        
    }
    
    enum Mutation {
        
        
    }
    
    struct State {
        
    }
    
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
            
        }
        
        func reduce(state: State, mutation: Mutation) -> State {
            var newState = state
            
            
            switch mutation {
                
                
            }
            
            return newState
        }
        
        
        
    }
}
