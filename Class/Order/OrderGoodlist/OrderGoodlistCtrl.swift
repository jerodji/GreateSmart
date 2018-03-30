//
//  OrderGoodlistCtrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderGoodlistCtrl: NSObject,UITableViewDelegate,UITableViewDataSource {

    var view : OrderGoodlistTableView?
    
    override init() {
        super.init()
    }
    
    func createView(frame: CGRect) -> Void {
        view = OrderGoodlistTableView.init(frame: frame, style: UITableViewStyle.grouped)
        view?.delegate = self
        view?.dataSource = self
        view?.register(UINib.init(nibName: "OrderGoodlistCell", bundle: nil), forCellReuseIdentifier: "OrderGoodlistCellid")
        view?.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderGoodlistCellid")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return h_OrderGoodlistCell
    }
    
    
}
