//
//  BaseViewCell.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/17/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

public protocol BaseViewCell {
    static var reuseIdentifier: String { get }
    static var identifier: String { get }
    
    typealias ItemType
    
    func configureForItem(item: ItemType)
}

public extension BaseViewCell {
    public static var reuseIdentifier: String { return String(Self) + "ReuseIdentifier" }
    public static var identifier: String { return String(Self) + "Identifier" }
}