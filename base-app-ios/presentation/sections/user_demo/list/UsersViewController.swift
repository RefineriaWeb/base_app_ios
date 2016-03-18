//
//  UsersViewController.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit
import RxSwift

class UsersViewController: BaseViewController<UsersDemoPresenter>, BaseTableViewController {

    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var dataSource: BaseTableViewDataSource<UserDemoEntity, UsersTableViewCell>!
    var delegate: BaseTableViewDelegate<BaseTableViewDataSource<UserDemoEntity, UsersTableViewCell>, UsersDemoPresenter>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = BaseTableViewDataSource()
        delegate = BaseTableViewDelegate(dataSource: dataSource, presenter: presenter)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
    // MARK: - BaseTableViewController
    func showProgress() {
        loadingView.hidden = false
        tableView.hidden = true
    }
    
    func hideProgress() {
        loadingView.hidden = true
        tableView.hidden = false
    }
    
    // MARK: - Actions
    @IBAction func menuButtonPressed(sender: UIButton) {
        slideMenuController()?.openLeft()
    }
    
}

// MARK: - UsersView
extension UsersViewController: UsersView {
    
}
