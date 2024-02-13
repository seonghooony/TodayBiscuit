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
    private init(){}
    func initKecoDIContainer() -> () {
        self.container.register(ArpltnInforInqireSvcService.self){ _ in
            ArpltnInforInqireSvcService()
        }
        
        
        self.container.register(MsrstnInfoInqireSvcService.self){ _ in
            MsrstnInfoInqireSvcService()
        }
        
        
        self.container.register(ArpltnStatsSvcService.self){ _ in
            ArpltnStatsSvcService()
        }
        
        
        self.container.register(ArpltnInforInqireSvcRepositoryProtocol.self){ resolver in
            ArpltnInforInqireSvcRepository(arpltnInforInqireSvcService: resolver.resolve(ArpltnInforInqireSvcService.self)!)
        }
        
        
        self.container.register(MsrstnInfoInqireSvcRepositoryProtocol.self){ resolver in
            MsrstnInfoInqireSvcRepository(msrstnInfoInqireSvcService: resolver.resolve(MsrstnInfoInqireSvcService.self)!)
        }
        
        
        self.container.register(ArpltnStatsSvcRepositoryProtocol.self){ resolver in
            ArpltnStatsSvcRepository(arpltnStatsSvcService: resolver.resolve(ArpltnStatsSvcService.self)!)
        }
        

        self.container.register(SplashUseCaseProtocol.self){ resolver in
            SplashUseCase(
                arpltnInforInqireSvcRepository: resolver.resolve(ArpltnInforInqireSvcRepositoryProtocol.self)!,
                msrstnInfoInqireSvcRepository: resolver.resolve(MsrstnInfoInqireSvcRepositoryProtocol.self)!,
                arpltnStatsSvcRepository: resolver.resolve(ArpltnStatsSvcRepositoryProtocol.self)!
            )
        }
        
           
    }
}
