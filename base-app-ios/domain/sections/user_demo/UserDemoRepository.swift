//
//  UserDemoRepository.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift

protocol UserDemoRepository: Repository {
    func searchByUserName(nameUser: String) -> Observable<UserDemoEntity>
    func askForUsers() -> Observable<[UserDemoEntity]>
    func getSelectedUserDemoList() -> Observable<UserDemoEntity>
    func saveSelectedUserDemoList(user: UserDemoEntity) -> Observable<Bool>
}

