//
//  ForMaleModel.swift
//  GreateSmart
//
//  Created by Jerod on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ForMaleBlockElemModel: BaseModel {
    var imageUrl: String = ""
    var jumpUrl: String = ""
}

class ForMaleModel: BaseModel {

    var title: String = ""
    var smallTitle: String = ""
    var block:NSArray = []
    
    class func dataReader(_ data:Any!) -> ForMaleModel {
        var model = ForMaleModel()
        if data is NSDictionary {
            let dict = data as! NSDictionary
            model = ForMaleModel.mj_object(withKeyValues: dict)
            model.block = ForMaleBlockElemModel.mj_objectArray(withKeyValuesArray: model.block)
            //mj_objectArrayWithKeyValuesArray
        }
        return model
    }
    
}
