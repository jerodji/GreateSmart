//
//  HomeTableControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/25.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HomeTableControl: BaseControl {
    
    var tableView: HomeTableView!
    
    override init() {
        super.init()
    }
    
//    convenience init(frame:CGRect) {
//        self.init()
//        tableView.frame = frame
//    }
    
    init(frame:CGRect) {
        super.init()
        tableView = HomeTableView.init(frame: frame, style: UITableViewStyle.plain)
        
    }
    
    
    
    
    
}
