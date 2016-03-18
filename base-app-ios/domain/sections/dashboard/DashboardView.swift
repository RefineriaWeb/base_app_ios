//
//  DashboardView.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

protocol DashboardView: BaseView {
    func showItems(oItems: Observable<[ItemMenu]>) -> Disposable
    func showUsers()
    func showUser()
    func showUserSearch()
}
