//
//  PresentationModule.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import Swinject

class PresentationModule {
    
    static func setup(defaultContainer: Container) {
        
        DataPresentationModule.setup(defaultContainer)
        DomainPresentationModule.setup(defaultContainer)
        
        defaultContainer.registerForStoryboard(LaunchViewController.self) { r, c in
            c.presenter = r.resolve(LaunchPresenter.self)!
        }
        
        defaultContainer.registerForStoryboard(DashboardViewController.self) { r, c in
            c.presenter = r.resolve(DashboardPresenter.self)!
        }
        
        defaultContainer.registerForStoryboard(UsersViewController.self) { r, c in
            c.presenter = r.resolve(UsersDemoPresenter.self)!
        }
        
        defaultContainer.registerForStoryboard(UserViewController.self) { r, c in
            c.presenter = r.resolve(UserDemoPresenter.self)!
        }
        
        defaultContainer.registerForStoryboard(SearchUserViewController.self) { r, c in
            c.presenter = r.resolve(SearchUserDemoPresenter.self)!
        }
    }
    
}
