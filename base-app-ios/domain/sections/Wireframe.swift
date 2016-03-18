//
//  Wireframe.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/11/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

/**
* Provides the routing for the application screens. Its behaviour is defined in the presentation layer.
*/

protocol Wireframe {
    func dashboard()
    func searchUserScreen()
    func userScreen()
    func usersScreen()
    func popCurrentScreen()
}

