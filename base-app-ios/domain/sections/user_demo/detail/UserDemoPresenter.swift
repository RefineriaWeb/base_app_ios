//
//  UserDemoPresenter.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class UserDemoPresenter: Presenter {

    private let getSelectedDemoUserListUseCase: GetSelectedDemoUserListUseCase
    
    init(getSelectedDemoUserListUseCase: GetSelectedDemoUserListUseCase, wireframe: Wireframe, uiDomain: UIDomain, subscribeOn: SubscribeOn, observeOn: ObserveOn) {
        self.getSelectedDemoUserListUseCase = getSelectedDemoUserListUseCase
        super.init(wireframe: wireframe, uiDomain: uiDomain, subscribeOn: subscribeOn, observeOn: observeOn)
    }
    
    override func attachView(view: BaseView) {
        super.attachView(view)
        
        safetyReportError(getSelectedDemoUserListUseCase.react()).disposable { oUser in (self.view as! UserView).showUser(oUser) }
    }
    
    func goToSearchScreen() {
        wireframe.searchUserScreen()
    }
}
