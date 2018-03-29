//
//  HotInStoreModel.swift
//  GreateSmart
//
//  Created by Jerod on 2018/3/12.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotInStoreBlockElemModel: BaseModel {
    @objc var itemName : String = ""
    @objc var itemTitleImage : String = ""
    @objc var price : String = ""
    @objc var jumpUrl : String = ""
}

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
            model.data.block = HotInStoreBlockElemModel.mj_objectArray(withKeyValuesArray: model.data.block)
        }
        return model
    }
    
}
