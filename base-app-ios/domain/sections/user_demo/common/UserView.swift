//
//  UserView.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/15/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

protocol UserView: BaseView {
    func showUser(oUser: Observable<UserDemoEntity>) -> Disposable

}
