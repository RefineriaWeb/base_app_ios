//
//  BaseTableViewController.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/17/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit
import RxSwift

public protocol BaseTableViewController: class {
    var tableView: UITableView! { get }
    typealias TableViewDataSource: BaseViewDataSource
    var dataSource: TableViewDataSource! { get set }
    func showProgress()
    func hideProgress()
}

public extension BaseTableViewController {
    public func showItems(oItems: Observable<[TableViewDataSource.ItemType]>) -> Disposable {
        showProgress()
        return oItems.subscribe(onNext: { (items) -> Void in
            self.dataSource.items = items
            self.tableView.reloadData()
            },
            onError: nil,
            onCompleted: { self.hideProgress() },
            onDisposed: nil)
    }
}