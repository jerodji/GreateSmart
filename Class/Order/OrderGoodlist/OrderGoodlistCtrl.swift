//
//  OrderGoodlistCtrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderGoodlistCtrl: NSObject {

    var view : OrderGoodlistTableView?
    
    override init() {
        super.init()
    }
    
    
    func createView(frame: CGRect) -> Void {
        view = OrderGoodlistTableView.init(frame: frame, style: UITableViewStyle.grouped)
        
    }
    
}
