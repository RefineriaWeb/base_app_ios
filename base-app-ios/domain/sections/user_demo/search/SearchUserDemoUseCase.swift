//
//  SearchUserDemoUseCase.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/19/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class SearchUserDemoUseCase: UseCase<UserDemoEntity> {

    private var repository: UserDemoRepository!
    private var name: String!
    
    init(repository: UserDemoRepository, uiDomain: UIDomain) {
        self.repository = repository
        super.init(uiDomain: uiDomain)
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    override func react() -> Observable<UserDemoEntity> {
        assert(name != nil)
        return repository.searchByUserName(name)
    }
    
}
