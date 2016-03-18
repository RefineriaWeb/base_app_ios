//
//  UsersView.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

protocol UsersView: BaseView {
    func showItems(oUser: Observable<[UserDemoEntity]>) -> Disposable
}
