//
//  DataModule.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import Swinject
import RxCache

class DataModule {
    
    static func setup(defaultContainer: Container) {
        
        defaultContainer.register(RxCache.self) { _ in RxCache.Providers }
        
        defaultContainer.register(RestApi.self) { _ in RestApiMoya() }
            .inObjectScope(.Container)
        
        // Repositories
        
        defaultContainer.register(UserDemoRepository.self) { r in
            UserDemoDataRepository(restApi: r.resolve(RestApi.self)!, rxProviders: r.resolve(RxCache.self)!, uiData: r.resolve(UIData.self)!)
            }
            .inObjectScope(.Container)

    }
}