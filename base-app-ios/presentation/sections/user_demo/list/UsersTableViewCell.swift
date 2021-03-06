//
//  UsersTableViewCell.swift
//  base-app-ios
//
//  Created by Roberto Frontado on 2/18/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import UIKit
import SDWebImage

class UsersTableViewCell: UITableViewCell, BaseViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    func configureForItem(item: UserDemoEntity) {
        userNameLabel.text = item.login
        userImageView.image = nil
        if let imageURL = NSURL(string: item.getAvatarUrl()) {
            userImageView.sd_setImageWithURL(imageURL)
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // If the cell is selected, deselect it!
        if selected {
            setSelected(false, animated: false)
        }
    }
}
