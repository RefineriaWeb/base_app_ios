//
//  LaunchPresenter.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class LaunchPresenter: Presenter {

    override init(wireframe: Wireframe, uiDomain: UIDomain, subscribeOn: SubscribeOn, observeOn: ObserveOn) {
        super.init(wireframe: wireframe, uiDomain: uiDomain, subscribeOn: subscribeOn, observeOn: observeOn)
    }

    override func resumeView() {
        wireframe.dashboard()
    }
}
