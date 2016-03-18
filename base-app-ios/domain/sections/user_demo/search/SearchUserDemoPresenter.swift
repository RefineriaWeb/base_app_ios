//
//  SearchUserDemoPresenter.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/19/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class SearchUserDemoPresenter: Presenter {

    private var searchUserDemoUseCase: SearchUserDemoUseCase!
    
    init(searchUserDemoUseCase: SearchUserDemoUseCase, wireframe: Wireframe, uiDomain: UIDomain, subscribeOn: SubscribeOn, observeOn: ObserveOn) {
        self.searchUserDemoUseCase = searchUserDemoUseCase
        super.init(wireframe: wireframe, uiDomain: uiDomain, subscribeOn: subscribeOn, observeOn: observeOn)
    }
    
    func getUserByName(username: String) {
        if username.isEmpty {
            safetyReportError(uiDomain.errorNonEmptyFields()).disposable { oFeedback in self.uiDomain.showFeedback(oFeedback) }
            return
        }
        searchUserDemoUseCase.setName(username)
        safetyReportError(searchUserDemoUseCase.react()).disposable { oUser in (self.view as! UserView).showUser(oUser) }
    }
}
