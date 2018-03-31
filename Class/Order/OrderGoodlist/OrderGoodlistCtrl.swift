//
//  OrderGoodlistCtrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

let h_OrderGoodlistCell : CGFloat = CGFloat(105.0)
let h_orderGoodlistCellHead : CGFloat = CGFloat(35)
let h_orderGoodlistCellFoot : CGFloat = CGFloat(75)

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderGoodlistCellid")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return h_OrderGoodlistCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return h_orderGoodlistCellHead
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.yellow.withAlphaComponent(0.4)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return h_orderGoodlistCellFoot
    }
    
}
