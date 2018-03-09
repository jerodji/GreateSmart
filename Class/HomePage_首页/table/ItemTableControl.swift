//
//  ItemTableCcontrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/6.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemTableControl: BaseControl {
    
    var tableView: ItemTableView?
    
    
    override init() {
        super.init()
    }
    
    convenience init(tableFrame: CGRect) {
        self.init()
        
        tableView = ItemTableView.init(frame: tableFrame)
        
    }
    
    func handleHomeData(homeData:NSArray!) -> Void {
        
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
                    //let model = SortTypeModel.yy_model(with: dict as! [AnyHashable : Any])
                    let model = SortTypeModel.getModelWithDict(dict)
                    
                }; break
                    


                default:
                    break
                }
                
            }
            
        }
    }
    
}
