//
//  AddressControl.swift
//  GreateSmart
//
//  Created by Jerod on 2018/4/2.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddressControl: BaseControl,UITableViewDelegate,UITableViewDataSource {

    var view : AddressView?
    var dataList : NSMutableArray = []
    private var pageNum : Int = 0
    private var pageSize: Int = 10
    
    override init() {
        super.init()
        
    }
    
    func initView(_ frame:CGRect) -> Void {
        
        view = AddressView.init(frame: frame, style: UITableViewStyle.plain)
        view!.delegate = self
        view!.dataSource = self
        view!.register(UINib.init(nibName: "AddressCell", bundle: nil), forCellReuseIdentifier: "AddressCellid")
        view!.register(UINib.init(nibName: "AddressCell", bundle: nil), forCellReuseIdentifier: "AddressCellid0")
        view!.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreAddress))
    }
    
    //加载更多数据
    @objc func loadMoreAddress() -> () {
        pageNum += 1 // 从 1 开始
        NetHttp.ins.getAddresses(pageNo: pageNum, pageSize: pageSize) { (res) in
            
            let list = (res as! NSDictionary)["list"] as! NSArray
            
            if list.count == 0
            {
                self.view?.mj_footer.endRefreshingWithNoMoreData()
            }
            else
            {
                for i in 0...list.count-1 {
                    let dict = list[i] as! NSDictionary
                    let model = AddressModel.mj_object(withKeyValues: dict)
                    self.dataList.add(model as AddressModel!)
                }
                self.view?.mj_footer.endRefreshing()
                self.view?.reloadData()
            }
            
        }
    }
    
    //MARK: -

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : AddressCell!
        let model: AddressModel = dataList.object(at: indexPath.row) as! AddressModel
        //防止复用改变样式, 所以采用不同的id
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "AddressCellid0") as! AddressCell
            cell.selectionStyle = .none
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "AddressCellid") as! AddressCell
            cell.selectionStyle = .none
            cell.addBtn.isHidden = true
            cell.addBtnHeight.constant = CGFloat(0)
            cell.addLine.isHidden = true
        }
        
        cell.nameLab.text = "\(model.userId)"//model.receiver
        cell.phoneLab.text = model.phonenum
        cell.addressLab.text = model.province + model.city + model.area + model.address
        if model.defaultAddressId==1 {
            cell.setDefBtn.setImage(UIImage.init(named: "xuanzhogn2"), for: .normal)
        } else {
            cell.setDefBtn.setImage(UIImage.init(named: "gouxuan"), for: .normal)
        }
        
        return cell
    }
    
    
    
    
}
