//
//  SaveUserDemoSelectedListUseCase.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

class SaveUserDemoSelectedListUseCase: UseCase<Bool> {
    
    private let repository: UserDemoRepository
    private var userDemoEntity: UserDemoEntity!
    
    init(repository: UserDemoRepository, uiDomain: UIDomain) {
        self.repository = repository
        super.init(uiDomain: uiDomain)
    }
    
    func setUserDemoEntity(userDemoEntity: UserDemoEntity) {
        self.userDemoEntity = userDemoEntity
    }
    
    override func react() -> Observable<Bool> {
        assert(userDemoEntity != nil)
        return repository.saveSelectedUserDemoList(userDemoEntity)
    }

}
