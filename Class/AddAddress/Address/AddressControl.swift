//
//  AddressControl.swift
//  GreateSmart
//
//  Created by Jerod on 2018/4/2.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddressControl: BaseControl,UITableViewDelegate,UITableViewDataSource {

    var scene: UIViewController?
    var view : AddressTableView?
    var dataList : NSMutableArray = []
    private var pageNum : Int = 1
    private var pageSize: Int = 10
    
    typealias SelecBLK = (AddressModel)->()
    var selecCb : SelecBLK?
    
    override init() {
        super.init()
        
    }
    
    func initView(_ frame:CGRect) -> Void {
        
        view = AddressTableView.init(frame: frame, style: UITableViewStyle.plain)
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
                self.view?.mj_footer.endRefreshingWithNoMoreData()/*没有跟多数据*/
            }
            else
            {
                for i in 0...list.count-1 {
                    let dict = list[i] as! NSDictionary
                    let model : AddressModel = AddressModel.mj_object(withKeyValues: dict)
                    self.dataList.add(model)
                }
                self.view?.mj_footer.endRefreshing()
                self.view?.reloadData()
            }
        }
    }
    
    //MARK:跟新默认状态,刷新界面
    func updateDataListDefaultStatus(index:Int) -> Void {
        for i in 0...dataList.count-1 {
            let model: AddressModel = dataList.object(at: i) as! AddressModel
            if i != index {
                model.defaultAddressId = 0
            } else {
                model.defaultAddressId = 1
            }
        }
        
        DispatchQueue.main.async {
            self.view?.reloadData()
        }
    }
    
    //MARK: -
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model: AddressModel = dataList.object(at: indexPath.row) as! AddressModel
        (selecCb==nil) ? delog("没有实现selecCb") : selecCb!(model)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
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
        
        cell.nameLab.text = model.receiver
        cell.phoneLab.text = model.phonenum
        cell.addressLab.text = model.province + model.city + model.area + model.address
        if model.defaultAddressId==1 {
            cell.setDefBtn.setImage(UIImage.init(named: "xuanzhogn2"), for: .normal)
        } else {
            cell.setDefBtn.setImage(UIImage.init(named: "gouxuan"), for: .normal)
        }
        
        //MARK:事件回调
        //设置默认地址
        cell.changeDfCB = {
            if model.defaultAddressId == 0 {
                NetHttp.ins.changeDfAddress(addressId: model.adrsId, succInfo: { (res) in
                    /** 成功后刷新界面,跟新默认状态 */
                    self.updateDataListDefaultStatus(index: indexPath.row)
                })
            } else {
                MBHUDToast.showMsg("已经是默认地址")
            }
        }
        
        //增加地址
        cell.AddCb = {
            let newvc = CreateNewAdresVC()
            self.scene?.navigationController?.pushViewController(newvc, animated: true)
        }
        
        //修改地址
        cell.changeCb = {
            let newvc = CreateNewAdresVC()
            newvc.model = model
            self.scene?.navigationController?.pushViewController(newvc, animated: true)
        }
        
        //删除地址
        cell.deleteCb = {
//            if model.defaultAddressId == 1 {
//                MBHUDToast.showMsg("不能删除默认地址")
//            } else {
                let pam: NSDictionary = ["id":Int.init(model.adrsId)!]
                NetHttp.ins.removeAddress(params: pam, succCb: { (res) in
                    self.dataList.removeObject(at: indexPath.row)
                    DispatchQueue.main.async {
                        self.view?.reloadData()
                    }
                })
//            }
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 165
        }
        return 110
    }
    
    
    
    
}
