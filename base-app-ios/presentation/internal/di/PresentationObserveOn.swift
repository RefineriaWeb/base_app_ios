//
//  PresentationObserveOn.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class PresentationObserveOn: ObserveOn {
    
    func getScheduler() -> ImmediateSchedulerType {
        return MainScheduler.instance
    }
    
}