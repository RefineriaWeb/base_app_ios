//
//  UseCase.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

/**
 * Base class for any UseCase.
 * The UseCase retrieves its data from an specific repository and
 * it is in charge of processing data for any presenter.
 * @see  Repository
 */

class UseCase<D> {
    
    internal let uiDomain: UIDomain
    
    init(uiDomain: UIDomain) {
        self.uiDomain = uiDomain
    }
    
    /**
     * Observable built for every use case
     */
    func react() -> Observable<D> {
        fatalError("Error: subclass of \(String(UseCase.self)) needs to implements builtObservable")
    }
}
