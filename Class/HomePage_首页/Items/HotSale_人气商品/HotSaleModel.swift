//
//  HotSaleModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotSaleBlockElemModel: BaseModel {
    
    @objc var itemId: String = ""
    @objc var itemName: String = ""
    @objc var originalPrice: String = ""
    @objc var itemTitleImage: String = ""
    @objc var price: String = ""
    @objc var origin: String = ""
    @objc var publicity: String = ""
    @objc var jumpUrl: String = ""
    
}

class HotSaleDataModel: BaseModel {
    @objc var title: String = ""
    @objc var smallTitle: String = ""
    @objc var block: NSArray = []
}

class HotSaleModel: BaseModel {
    
    @objc var showType : String = ""
    @objc var data : HotSaleDataModel!
    
    
    class func dataReader(typeInfo:Any!) -> HotSaleModel {
        var model = HotSaleModel()
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            model = HotSaleModel.mj_object(withKeyValues: dict)
//            model.block = HotSaleBlockElemModel.mj_objectArray(withKeyValuesArray: model.block)
            model.data.block = HotSaleBlockElemModel.mj_objectArray(withKeyValuesArray: model.data.block)
        }
        return model
    }
}
