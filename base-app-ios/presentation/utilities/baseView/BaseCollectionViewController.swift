//
//  BaseCollectionViewController.swift
//  eat-and-check
//
//  Created by Roberto Frontado on 2/21/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit
import RxSwift

public protocol BaseCollectionViewController: class {
    var collectionView: UICollectionView! { get }
    typealias CollectionViewDataSource: BaseViewDataSource
    var dataSource: CollectionViewDataSource! { get set }
    func showProgress()
    func hideProgress()
}

public extension BaseCollectionViewController {
    public func showItems(oItems: Observable<[CollectionViewDataSource.ItemType]>) -> Disposable {
        showProgress()
        return oItems.subscribe(onNext: { (items) -> Void in
            self.dataSource.items = items
            self.collectionView.reloadData()
            },
            onError: nil,
            onCompleted: { self.hideProgress() },
            onDisposed: nil)
    }
}