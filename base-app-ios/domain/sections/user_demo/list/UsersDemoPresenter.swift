//
//  UsersDemoPresenter.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class UsersDemoPresenter: Presenter {
    private let getUsersDemoUseCase: GetUsersDemoUseCase
    private let saveUserDemoSelectedListUseCase: SaveUserDemoSelectedListUseCase

    init(getUsersDemoUseCase: GetUsersDemoUseCase, saveUserDemoSelectedListUseCase: SaveUserDemoSelectedListUseCase, wireframe: Wireframe, uiDomain: UIDomain, subscribeOn: SubscribeOn, observeOn: ObserveOn) {
        self.getUsersDemoUseCase = getUsersDemoUseCase
        self.saveUserDemoSelectedListUseCase = saveUserDemoSelectedListUseCase
        super.init(wireframe: wireframe, uiDomain: uiDomain, subscribeOn: subscribeOn, observeOn: observeOn)
    }
    
    override func attachView(view: BaseView) {
        super.attachView(view)
        
        safetyReportError(getUsersDemoUseCase.react()).disposable { oUsers in (view as! UsersView).showItems(oUsers) }
    }
    
    func goToDetail(user: UserDemoEntity) {
        saveUserDemoSelectedListUseCase.setUserDemoEntity(user)
        safetyReportError(saveUserDemoSelectedListUseCase.react())
            .disposable { oSuccess in oSuccess.subscribeNext { success in self.wireframe.userScreen() } }
    }
}

// MARK: - BaseTableViewPresenter
extension UsersDemoPresenter: BaseTableViewPresenter {
    
    func onItemClick(item: UserDemoEntity, position: Int) {
        goToDetail(item)
    }
}