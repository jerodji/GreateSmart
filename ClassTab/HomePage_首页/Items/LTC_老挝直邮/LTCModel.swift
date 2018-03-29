//
//  LTCModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class LTCDataModel: BaseModel {
    @objc var title: String = ""
    @objc var smallTitle: String = ""
    @objc var imageUrl : String = ""
    @objc var jumpUrl : String = ""
}

class LTCModel: BaseModel {

    @objc var showType : String = ""
    @objc var data : LTCDataModel!
    
    class func dataReader(typeInfo:Any!) -> LTCModel {
        var model = LTCModel()
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            model = LTCModel.mj_object(withKeyValues: dict)
        }
        return model
    }
}
