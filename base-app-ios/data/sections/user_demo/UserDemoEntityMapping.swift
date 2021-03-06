
//
//  UserDemoEntityMapping.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import ObjectMapper
import RxCache

extension UserDemoEntity: Mappable, OMCacheable {
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        login <- map["login"]
        avatarUrl <- map["avatar_url"]
    }
    
}
