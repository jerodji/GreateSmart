//
//  ItemTableCcontrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemTableControl: BaseControl {
    
//    var bannerView: BannerView?
    var tableView: ItemTableView?
    
    
    override init() {
        super.init()
    }
    
    convenience init(tableFrame: CGRect) {
        self.init()
        
        tableView = ItemTableView.init(frame: tableFrame)
        
    }

    
    
}
