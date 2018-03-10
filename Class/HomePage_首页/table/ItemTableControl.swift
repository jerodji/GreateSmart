//
//  ItemTableCcontrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemTableControl: BaseControl,UITableViewDelegate,UITableViewDataSource {
    
    var tableView: ItemTableView!
    var dataArray: NSArray!
    
    
    let sortTypeCtrl = SortTypeControl.init()
    
    
    override init() {
        super.init()
    }
    
    convenience init(tableFrame: CGRect) {
        self.init()
        tableView = ItemTableView.init(frame: tableFrame)
        tableView.contentInset = UIEdgeInsetsMake(heightBanner, 0, 0, 0)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        //self.showsVerticalScrollIndicator = false
        //self.showsHorizontalScrollIndicator = false
    }
    
    func handleHomeData(homeData:NSArray!) -> Void {
        
        dataArray = homeData!
        
        for obj in homeData! {
            
            let index = homeData!.index(of: obj)
            
            if obj is NSDictionary {
                let dict = obj as! NSDictionary
                let type = dict.object(forKey: "showType") as! String
                
                switch (type) {
                    
                case ShowTypeENUM.NewBanner.rawValue :  do {
                    delog("2")
                    
                }; break
                    
                case ShowTypeENUM.SortType.rawValue: do {
                    sortTypeCtrl.handleData(homeData.object(at: index))
                }; break
                    
                    


                default:
                    break
                }
                
            }
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //delog("\(scrollView.contentOffset.y)")
        tableView.banner.y = scrollView.contentOffset.y
        let offsetY = scrollView.contentOffset.y + heightBanner
        if offsetY < 0 {
            //banner.frame = CGRect.init(x: 0, y: scrollView.contentOffset.y, width: kScreenW, height: ItemHeight_banner-offsetY)
            tableView.banner.height = heightBanner-offsetY
        }
    }
    
    //MARK:-
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeueID = String.init(format: "homeItemCellId_%i", arguments: [indexPath.row])
        var cell = tableView.dequeueReusableCell(withIdentifier: dequeueID)
        if nil == cell {
            cell = ItemCell.init(style: .default, reuseIdentifier: dequeueID)
            cell?.selectionStyle = .none
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delog("\(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightTitle
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ItemTitleView.loadFromXIB()
        header.frame = CGRect.init(x: 0, y: 0, width: kScreenW, height: heightTitle)
        
        return header
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}
