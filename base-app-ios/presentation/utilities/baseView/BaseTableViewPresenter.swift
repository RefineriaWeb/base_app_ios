//
//  BaseTableViewPresenter.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/17/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

public protocol BaseTableViewPresenter {
    typealias ItemType
    func onItemClick(item: ItemType, position: Int)
}
