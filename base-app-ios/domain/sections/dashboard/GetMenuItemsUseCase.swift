//
//  GetMenuItemsUseCase.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class GetMenuItemsUseCase: UseCase<[ItemMenu]> {

    static let ID_USERS = 1
    static let ID_USER = 2
    static let ID_SEARCH_USER = 3
    private let dashboardItemsMenu: DashboardItemsMenu

    init(dashboardItemsMenu: DashboardItemsMenu, uiDomain: UIDomain) {
        self.dashboardItemsMenu = dashboardItemsMenu
        super.init(uiDomain: uiDomain)
    }
    
    override func react() -> Observable<[ItemMenu]> {
        let users = ItemMenu(id: GetMenuItemsUseCase.ID_USERS)
        dashboardItemsMenu.configureUsers(users)
        
        let user = ItemMenu(id: GetMenuItemsUseCase.ID_USER)
        dashboardItemsMenu.configureUser(user)
        
        let searchUser = ItemMenu(id: GetMenuItemsUseCase.ID_SEARCH_USER)
        dashboardItemsMenu.configureSearchUser(searchUser)
        
        return Observable.just([users, user, searchUser])
    }
}
