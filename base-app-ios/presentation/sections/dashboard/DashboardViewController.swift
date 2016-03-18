//
//  DashboardViewController.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/17/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit
import RxSwift
import Swinject

class DashboardViewController: BaseViewController<DashboardPresenter>, BaseTableViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource: BaseTableViewDataSource<ItemMenu, DashboardTableViewCell>!
    var delegate: BaseTableViewDelegate<BaseTableViewDataSource<ItemMenu, DashboardTableViewCell>, DashboardPresenter>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = BaseTableViewDataSource()
        delegate = BaseTableViewDelegate(dataSource: dataSource, presenter: presenter)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    // MARK: - BaseTableViewController
    func showProgress() {
        
    }
    
    func hideProgress() {
        
    }
    
    // MARK: - Private methods
    func changeMainViewController(viewController: UIViewController) {
        
        let nvc: UINavigationController = UINavigationController(rootViewController: viewController)
        self.slideMenuController()?.changeMainViewController(nvc, close: true)
    }
}

// MARK: - DashboardView
extension DashboardViewController: DashboardView {
    
    func showItems(oItems: Observable<[ItemMenu]>) -> Disposable {
        showProgress()
        return oItems.subscribe(onNext: { (items) -> Void in
            self.dataSource.items = items
            self.tableView.reloadData()
            self.showUsers()
            },
            onError: nil,
            onCompleted: { self.hideProgress() },
            onDisposed: nil)
    }
    
    func showUsers() {
        changeMainViewController(R.storyboard.user.usersViewController()!)
    }
    
    func showUser() {
        changeMainViewController(R.storyboard.user.userViewController()!)
    }
    
    func showUserSearch() {
        changeMainViewController(R.storyboard.user.searchUserViewController()!)
    }
}
