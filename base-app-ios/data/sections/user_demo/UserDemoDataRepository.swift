//
//  UserDemoDataRepository.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import RxSwift
import ObjectMapper
import RxCache

class UserDemoDataRepository: DataRepository, UserDemoRepository {

    override init(restApi: RestApi, rxProviders: RxCache, uiData: UIData) {
        super.init(restApi: restApi, rxProviders: rxProviders, uiData: uiData)
    }
    
    func searchByUserName(nameUser: String) -> Observable<UserDemoEntity> {
        return restApi.getUser(nameUser)
            .flatMap { (response) -> Observable<UserDemoEntity> in
            
                if let error: Observable<UserDemoEntity> = self.handleError(response) {
                    return error
                }
                
                do {
                    let responseUser: UserDemoEntity = try response.mapObject()
                    return Observable.just(responseUser)
                } catch {
                    return self.buildObservableError(self.uiData.genericError())
                }
        }
    }
    
    func askForUsers() -> Observable<[UserDemoEntity]> {
        
//        return Observable.create({ (subscriber) -> Disposable in
//            subscriber.onNext([UserDemoEntity]())
//            subscriber.onCompleted()
//            return NopDisposable.instance
//        }).map({ (UsersView) -> [UserDemoEntity] in
//            return UsersView
//        })
        
        return restApi.getUsers().observeOn(DomainSubscribeOn().getScheduler())
            .flatMap { (response) -> Observable<[UserDemoEntity]> in
                
                if let error: Observable<[UserDemoEntity]> = self.handleError(response) {
                    return error
                }
                
                do {
                    let responseUser: [UserDemoEntity] = try response.mapArray()
                    return Observable.just(responseUser)
                } catch {
                    return self.buildObservableError(self.uiData.genericError())
                }
        }
    }
    
    func getSelectedUserDemoList() -> Observable<UserDemoEntity> {
        let provider = RxCacheProviders.GetSelectedUserDemoList(evict: false)
        return rxProviders.cache(RxCache.errorObservable(UserDemoEntity.self), provider: provider)
    }
    
    func saveSelectedUserDemoList(user: UserDemoEntity) -> Observable<Bool> {
        let provider = RxCacheProviders.GetSelectedUserDemoList(evict: true)
        return rxProviders.cache(Observable.just(user), provider: provider)
            .map { user in true }
    }

}