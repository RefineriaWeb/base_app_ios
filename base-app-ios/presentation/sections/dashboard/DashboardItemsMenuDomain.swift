//
//  DashboardItemsMenuDomain.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/17/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

class DashboardItemsMenuDomain: DashboardItemsMenu {
    
    func configureUsers(itemMenu: ItemMenu) {
        itemMenu.title = "Users"
    }
    
    func configureUser(itemMenu: ItemMenu) {
        itemMenu.title = "User"
    }
    
    func configureSearchUser(itemMenu: ItemMenu) {
        itemMenu.title = "Find user"
    }
}
