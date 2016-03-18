//
//  BaseCollectionViewPresenter.swift
//  eat-and-check
//
//  Created by Roberto Frontado on 2/21/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

public protocol BaseCollectionViewPresenter {
    typealias ItemType
    func onItemClick(item: ItemType, position: Int)
}
