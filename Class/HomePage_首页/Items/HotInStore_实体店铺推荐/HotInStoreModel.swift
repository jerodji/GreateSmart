//
//  HotInStoreModel.swift
//  GreateSmart
//
//  Created by Jerod on 2018/3/12.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotInStoreDataModel : BaseModel {
    @objc var title:String = ""
    @objc var smallTitle:String = ""
    @objc var imageUrl:String = ""
    @objc var jumpUrl:String = ""
    @objc var type: String = ""
    @objc var name: String = ""
    @objc var block: NSMutableArray = []
}

class HotInStoreModel: BaseModel {
    
    @objc var showType : String = ""
    @objc var data : HotInStoreDataModel!
    
    class func dataReader(typeInfo:Any) -> HotInStoreModel {
        var model = HotInStoreModel()
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            model = HotInStoreModel.mj_object(withKeyValues: dict)
        }
        return model
    }
    
}
