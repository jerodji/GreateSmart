//
//  AccountTableControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AccountTableControl: BaseControl,UITableViewDelegate,UITableViewDataSource {

    var view : AccountTableView?
    var dataArray : NSMutableArray = []
    
    override init() {
        super.init()
        
        //MARK: 测试数据
        for i in 0...7 {
            let model = AcountGoodModel()
            model.selecBtnImage = "weixuanzhong"
            dataArray.add(model)
        }
    }
    
    func initView(frame:CGRect) -> Void {
        view = AccountTableView.init(frame: frame, style: UITableViewStyle.grouped)
        view!.backgroundColor = .white
        view!.delegate = self
        view!.dataSource = self
        view!.register(UINib.init(nibName: "AcountHeadView", bundle: nil), forHeaderFooterViewReuseIdentifier: "AcountHeadViewid")
        view!.register(UINib.init(nibName: "AcountGoodCell", bundle: nil), forCellReuseIdentifier: "AcountGoodCellid")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AcountGoodCellid") as? AcountGoodCell
        cell?.selectionStyle = .none
        cell?.selecBtn.setImage(UIImage.init(named: "weixuanzhong"), for: .normal)
//        cell?.selecBtnCB = {
//            cell?.selecBtn.setImage(UIImage.init(named: "xuanzhogn2"), for: .normal)
//        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 97
    }
    // head view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "AcountHeadViewid")
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delog(indexPath)

    }
    
}
