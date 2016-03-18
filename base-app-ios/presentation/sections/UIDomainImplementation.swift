//
//  UIDomainImplementation.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class UIDomainImplementation: UIDomain {

    func errorNonEmptyFields() -> Observable<String> {
        return Observable.just("Fill missing fields")
    }
    
    func showFeedback(oFeedback: Observable<String>) -> Disposable {
        return oFeedback.subscribeNext { feedback in UIApplication.topViewController()?.showAlertMessage(feedback)}
    }

}
