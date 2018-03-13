//
//  ForMaleModel.swift
//  GreateSmart
//
//  Created by Jerod on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ForMaleBlockElemModel: BaseModel {
    @objc var imageUrl: String = ""
    @objc var jumpUrl: String = ""
}

class ForMaleDataModel : BaseModel {
    @objc var title: String = ""
    @objc var smallTitle: String = ""
    @objc var block:NSArray = []
}

class ForMaleModel: BaseModel {

    @objc var showType : String = ""
    @objc var data : ForMaleDataModel!
    
    class func dataReader(typeInfo:Any!) -> ForMaleModel {
        var model = ForMaleModel()
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            model = ForMaleModel.mj_object(withKeyValues: dict)
            model.data.block = ForMaleBlockElemModel.mj_objectArray(withKeyValuesArray: model.data.block)
        }
        return model
    }
    
}
