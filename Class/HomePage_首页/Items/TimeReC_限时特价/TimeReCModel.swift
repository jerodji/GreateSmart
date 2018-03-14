//
//  TimeReCModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class TimeReCBlockElemModel: BaseModel {
    
    @objc var itemName : String = ""
    @objc var originalPrice : String = ""
    @objc var itemTitleImage : String = ""
    @objc var price : String = ""
    @objc var startTime : String = ""
    @objc var endTime : String = ""
    @objc var publicity : String = ""
    @objc var jumpUrl : String = ""
    
}

class TimeReCDataModel: BaseModel {
    @objc var title: String = ""
    @objc var smallTitle: String = ""
    @objc var block: NSArray = []
}

class TimeReCModel: BaseModel {
    
    @objc var showType : String = ""
    @objc var data : TimeReCDataModel!
    
    
    class func dataReader(typeInfo:Any!) -> TimeReCModel {

        var model = TimeReCModel()
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            model = TimeReCModel.mj_object(withKeyValues: dict)
            model.data.block = TimeReCBlockElemModel.mj_objectArray(withKeyValuesArray: model.data.block)
        }
        return model
    }
    
}
