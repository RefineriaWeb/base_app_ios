//
//  DomainModule.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import Swinject

class DomainModule {
    
    static func setup(defaultContainer: Container) {
        
        defaultContainer.register(SubscribeOn.self) { _ in DomainSubscribeOn() }
        
        // MARK: - Presenters & UseCases
        
        // MARK: - Launch
        defaultContainer.register(LaunchPresenter.self) { r in
            LaunchPresenter(wireframe: r.resolve(Wireframe.self)!, uiDomain: r.resolve(UIDomain.self)!, subscribeOn: r.resolve(SubscribeOn.self)!, observeOn: r.resolve(ObserveOn.self)!)
        }
        // MARK: - Dashboard
        defaultContainer.register(DashboardPresenter.self) { r in
            DashboardPresenter(getMenuItemsUseCase: r.resolve(GetMenuItemsUseCase.self)!, wireframe: r.resolve(Wireframe.self)!, uiDomain: r.resolve(UIDomain.self)!, subscribeOn: r.resolve(SubscribeOn.self)!, observeOn: r.resolve(ObserveOn.self)!)
        }
        defaultContainer.register(GetMenuItemsUseCase.self) { r in
            GetMenuItemsUseCase(dashboardItemsMenu: r.resolve(DashboardItemsMenu.self)!, uiDomain: r.resolve(UIDomain.self)!)
        }
        // MARK: - Users
        defaultContainer.register(UsersDemoPresenter.self) { r in
            UsersDemoPresenter(getUsersDemoUseCase: r.resolve(GetUsersDemoUseCase.self)!, saveUserDemoSelectedListUseCase: r.resolve(SaveUserDemoSelectedListUseCase.self)!, wireframe: r.resolve(Wireframe.self)!, uiDomain: r.resolve(UIDomain.self)!, subscribeOn: r.resolve(SubscribeOn.self)!, observeOn: r.resolve(ObserveOn.self)!)
        }
        defaultContainer.register(GetUsersDemoUseCase.self) { r in
            GetUsersDemoUseCase(repository: r.resolve(UserDemoRepository.self)!, uiDomain: r.resolve(UIDomain.self)!)
        }
        defaultContainer.register(SaveUserDemoSelectedListUseCase.self) { r in
            SaveUserDemoSelectedListUseCase(repository: r.resolve(UserDemoRepository.self)!, uiDomain: r.resolve(UIDomain.self)!)
        }
        // MARK: - User
        defaultContainer.register(UserDemoPresenter.self) { r in
            UserDemoPresenter(getSelectedDemoUserListUseCase: r.resolve(GetSelectedDemoUserListUseCase.self)!, wireframe: r.resolve(Wireframe.self)!, uiDomain: r.resolve(UIDomain.self)!, subscribeOn: r.resolve(SubscribeOn.self)!, observeOn: r.resolve(ObserveOn.self)!)
        }
        defaultContainer.register(GetSelectedDemoUserListUseCase.self) { r in
            GetSelectedDemoUserListUseCase(repository: r.resolve(UserDemoRepository.self)!, uiDomain: r.resolve(UIDomain.self)!)
        }
        // MARK: - Search User
        defaultContainer.register(SearchUserDemoPresenter.self) { r in
            SearchUserDemoPresenter(searchUserDemoUseCase: r.resolve(SearchUserDemoUseCase.self)!, wireframe: r.resolve(Wireframe.self)!, uiDomain: r.resolve(UIDomain.self)!, subscribeOn: r.resolve(SubscribeOn.self)!, observeOn: r.resolve(ObserveOn.self)!)
        }
        defaultContainer.register(SearchUserDemoUseCase.self) { r in
            SearchUserDemoUseCase(repository: r.resolve(UserDemoRepository.self)!, uiDomain: r.resolve(UIDomain.self)!)
        }
        
    }
}
