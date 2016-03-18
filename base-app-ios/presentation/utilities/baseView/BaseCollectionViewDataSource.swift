//
//  BaseCollectionViewDataSource.swift
//  eat-and-check
//
//  Created by Roberto Frontado on 2/19/16.
//  Copyright © 2016 Roberto Frontado. All rights reserved.
//

import Foundation
import UIKit

public class BaseCollectionViewDataSource<U, V: BaseViewCell where U == V.ItemType>
: NSObject, UICollectionViewDataSource, BaseViewDataSource {
    public var items = [U]()
    
    public override init() {
        super.init()
    }
    
    public func collectionView(
        collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return items.count
    }
    
    public func collectionView(
        collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
                V.reuseIdentifier,
                forIndexPath: indexPath
            )
            let item = itemAtIndexPath(indexPath)
            (cell as! V).configureForItem(item)
            return cell
    }

}
