//
//  BaseViewDataSource.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/17/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import Foundation

public protocol BaseViewDataSource {
    typealias ItemType
    
    var items: [ItemType] { get set }
}

public extension BaseViewDataSource {
    public func itemAtIndexPath(indexPath: NSIndexPath) -> ItemType {
        return items[indexPath.item]
    }
}