//
//  GetSelectedDemoUserListUseCase.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class GetSelectedDemoUserListUseCase: UseCase<UserDemoEntity> {

    private let repository: UserDemoRepository
    
    init(repository: UserDemoRepository, uiDomain: UIDomain) {
        self.repository = repository
        super.init(uiDomain: uiDomain)
    }
    
    override func react() -> Observable<UserDemoEntity> {
        return repository.getSelectedUserDemoList()
    }
    
}
