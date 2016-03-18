//
//  DashboardTableViewCell.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/17/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit

@objc
class DashboardTableViewCell: UITableViewCell, BaseViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    func configureForItem(item: ItemMenu) {
        titleLabel.text = item.title
        if let image = item.imageResource as? UIImage {
            iconImageView.image = image
        }
    }
}
