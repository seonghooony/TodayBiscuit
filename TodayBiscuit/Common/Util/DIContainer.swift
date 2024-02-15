//
//  DIContainer.swift
//  TodayBiscuit
//
//  Created by seonghoonkim on 2/13/24.
//

import Foundation
import Swinject

final class DIContainer {
    
    static let shared = DIContainer()
    var container: Container = Container()
    
    
    private init(){
        inject()
    }
    
    func inject() {
        registerDIKecoSvcServices()
        registerDIKecoRepositories()
        registerDIUseCase()
        
    }
    
    
    private func registerDIKecoSvcServices() {
        self.container.register(ArpltnInforInqireSvcService.self){ _ in
            return ArpltnInforInqireSvcService()
        }
        
        
        self.container.register(MsrstnInfoInqireSvcService.self){ _ in
            return MsrstnInfoInqireSvcService()
        }
        
        
        self.container.register(ArpltnStatsSvcService.self){ _ in
            return ArpltnStatsSvcService()
        }
    }
    
    
    private func registerDIKecoRepositories() {
        self.container.register(ArpltnInforInqireSvcRepositoryProtocol.self){ resolver in
            return ArpltnInforInqireSvcRepository(arpltnInforInqireSvcService: resolver.resolve(ArpltnInforInqireSvcService.self)!)
        }
        
        
        self.container.register(MsrstnInfoInqireSvcRepositoryProtocol.self){ resolver in
            MsrstnInfoInqireSvcRepository(msrstnInfoInqireSvcService: resolver.resolve(MsrstnInfoInqireSvcService.self)!)
        }
        
        
        self.container.register(ArpltnStatsSvcRepositoryProtocol.self){ resolver in
            ArpltnStatsSvcRepository(arpltnStatsSvcService: resolver.resolve(ArpltnStatsSvcService.self)!)
        }
    }
    
    
    private func registerDIUseCase() -> () {
        self.container.register(SplashUseCaseProtocol.self){ resolver in
            SplashUseCase(
                arpltnInforInqireSvcRepository: resolver.resolve(ArpltnInforInqireSvcRepositoryProtocol.self)!,
                msrstnInfoInqireSvcRepository: resolver.resolve(MsrstnInfoInqireSvcRepositoryProtocol.self)!,
                arpltnStatsSvcRepository: resolver.resolve(ArpltnStatsSvcRepositoryProtocol.self)!
            )
        }
        
    }
}
