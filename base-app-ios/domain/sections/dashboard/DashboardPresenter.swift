//
//  DashboardPresenter.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class DashboardPresenter: Presenter {

    private let getMenuItemsUseCase: GetMenuItemsUseCase!
    
    init(getMenuItemsUseCase: GetMenuItemsUseCase, wireframe: Wireframe, uiDomain: UIDomain, subscribeOn: SubscribeOn, observeOn: ObserveOn) {
        self.getMenuItemsUseCase = getMenuItemsUseCase
        super.init(wireframe: wireframe, uiDomain: uiDomain, subscribeOn: subscribeOn, observeOn: observeOn)
    }
    
    override func attachView(view: BaseView) {
        super.attachView(view)
        safetyReportError(getMenuItemsUseCase.react()).disposable { oItemsMenu in (view as! DashboardView).showItems(oItemsMenu) }
    }
    
    func setSelectedItemMenu(itemMenu: ItemMenu) {
        if itemMenu.id == GetMenuItemsUseCase.ID_USERS {
            (view as! DashboardView).showUsers()
        } else if itemMenu.id == GetMenuItemsUseCase.ID_USER {
            (view as! DashboardView).showUser()
        } else {
            (view as! DashboardView).showUserSearch()
        }
    }
}

// MARK: - BaseTableViewPresenter
extension DashboardPresenter: BaseTableViewPresenter {
    
    func onItemClick(item: ItemMenu, position: Int) {
        setSelectedItemMenu(item)
    }
}