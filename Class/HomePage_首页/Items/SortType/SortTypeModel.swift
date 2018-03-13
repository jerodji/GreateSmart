//
//  SortTypeModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/9.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit


@objc class SortTypeBlockElementModel: BaseModel {
    @objc var imageUrl = ""
    @objc var jumpUrl = ""
}

@objc class DataModel: BaseModel {
    @objc var block: NSMutableArray!
    @objc var smallTitle: String = ""
    @objc var title: String = ""
}

@objc class SortTypeModel: BaseModel {
    
    @objc var showType = ""
    @objc var data : DataModel!
    
    class func dataReader(typeInfo:Any!) -> SortTypeModel {
        var model = SortTypeModel()
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            model = SortTypeModel.mj_object(withKeyValues: dict)
            //model.data = DataModel.mj_object(withKeyValues: model.data)
            model.data.block = SortTypeBlockElementModel.mj_objectArray(withKeyValuesArray: model.data.block)
        }
        return model
    }
}
