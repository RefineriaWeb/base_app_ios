//
//  UIDomain.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

protocol UIDomain {
    func errorNonEmptyFields() -> Observable<String>
    func showFeedback(oFeedback: Observable<String>) -> Disposable
}
