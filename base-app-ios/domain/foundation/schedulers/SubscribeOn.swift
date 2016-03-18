//
//  SubscribeOn.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

/**
 * Provides the Scheduler for any Observable to subscribeOn
 * This interfaces is injected by Swinject and implemented in the presentation layer.
 * For example, in Android system you can use AndroidSchedulers.mainThread() using RxAndroid library
 */

protocol SubscribeOn {
    func getScheduler() -> ImmediateSchedulerType
}
