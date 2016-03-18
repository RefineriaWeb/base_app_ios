//
//  ObserveOn.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

/**
 * Provides the Scheduler for any Observable to observeOn
 * This interfaces is injected by Swinject
 */

protocol ObserveOn {
    func getScheduler() -> ImmediateSchedulerType
}
