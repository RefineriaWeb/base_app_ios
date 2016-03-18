//
//  DomainSubscribeOn.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class DomainSubscribeOn: SubscribeOn {
    
    func getScheduler() -> ImmediateSchedulerType {
        return SerialDispatchQueueScheduler(globalConcurrentQueueQOS: .Background)
    }
}