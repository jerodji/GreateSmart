//
//  HotInStoreModel.swift
//  GreateSmart
//
//  Created by Jerod on 2018/3/12.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotInStoreModel: BaseModel {
    
    var title:String = ""
    var smallTitle:String = ""
    var imageUrl:String = ""
    var jumpUrl:String = ""
    var type: String = ""
    var name: String = ""
    var block: NSMutableArray = []
    
    class func dataReader(_ data:Any) -> HotInStoreModel {
        var model = HotInStoreModel()
        if data is NSDictionary {
            let dict = data as! NSDictionary
            model = HotInStoreModel.mj_object(withKeyValues: dict)
        }
        return model
    }
    
}
