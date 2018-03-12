//
//  SortTypeModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/9.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit


@objc class SortTypeModel: BaseModel {
    
//    @objc var block: NSMutableArray = [SortTypeBlockElementModel]() as! NSMutableArray
    @objc var block: NSMutableArray!
    @objc var smallTitle: String = ""
    @objc var title: String = ""
    
    class func dataReader(_ data:Any!) -> SortTypeModel {
        var model = SortTypeModel()
        if data is NSDictionary {
            let dict = data as! NSDictionary
            model = SortTypeModel.mj_object(withKeyValues: dict)
            model.block = SortTypeBlockElementModel.mj_objectArray(withKeyValuesArray: model.block)
        }
        return model
    }
}


@objc class SortTypeBlockElementModel: BaseModel {
    @objc var imageUrl = ""
    @objc var jumpUrl = ""
}

