//
//  UserDemoEntity.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/15/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import ObjectMapper

struct UserDemoEntity {

    var id: Int!
    var login: String!
    var avatarUrl: String!
    
    init(id: Int, login: String, avatarUrl: String) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
    
    init?(_ map: Map) {
    }
    
    func getAvatarUrl() -> String {
        if avatarUrl == nil {
            return ""
        }
        
        if avatarUrl.isEmpty { return avatarUrl }
        return avatarUrl.componentsSeparatedByString("\\?")[0]
    }
    
}