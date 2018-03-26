//
//  AddToCartControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddToCartControl: BaseControl, UITableViewDelegate, UITableViewDataSource {

    var view : AddToCartView?
    
    override init() {
        super.init()
        
        view = AddToCartView.loadFromXIB()
        view?.configTableView.delegate = self
        view?.configTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: String.init(format: "addtocartConfigCellId"+"%d", indexPath.row))
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: String.init(format: "addtocartConfigCellId"+"%d", indexPath.row))
            
            if indexPath.row == 0 {
                let cellView = AddcartGoodConfigView.loadFromXIB()
                cellView.frameXib = cell?.bounds
                cellView.nameLab.text = "规格"
                
                cell?.addSubview(cellView)
            }
            
            if indexPath.row == 1 {
                let cellView = AddcartGoodConfigView.loadFromXIB()
                cellView.frameXib = cell?.bounds
                cellView.nameLab.text = "数量"
                
                cell?.addSubview(cellView)
            }
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
