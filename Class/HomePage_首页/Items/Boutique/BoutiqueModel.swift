//
//  BoutiqueModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BoutiqueBlockElemModel: BaseModel {
    
    @objc var imageUrl : String = ""
    @objc var jumpUrl : String = ""
    
}

class BoutiqueDataModel: BaseModel {
    @objc var title: String = ""
    @objc var smallTitle: String = ""
    @objc var block: NSArray = []
}

class BoutiqueModel: BaseModel {

    @objc var showType : String = ""
    @objc var data : BoutiqueDataModel!
    
    class func dataReader(typeInfo:Any!) -> BoutiqueModel {
        
        var model = BoutiqueModel()
        
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            model = BoutiqueModel.mj_object(withKeyValues: dict)
            model.data.block = BoutiqueBlockElemModel.mj_objectArray(withKeyValuesArray: model.data.block)
        }
        
        return model
    }
    
}
