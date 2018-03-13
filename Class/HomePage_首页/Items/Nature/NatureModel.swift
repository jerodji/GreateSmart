//
//  NatureModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class NatureBlockElemModel: BaseModel {
    
    @objc var img : String = ""
    @objc var shareUrl : String = ""
    @objc var title : String = ""
    @objc var descriptions : String = ""
    @objc var jumpUrl : String = ""
    
}

class NatureDataModel : BaseModel {
    @objc var title: String = ""
    @objc var smallTitle: String = ""
    @objc var block: NSArray = []
}

class NatureModel: BaseModel {

    @objc var showType : String = ""
    @objc var data : NatureDataModel!

 
    class func dataReader(typeInfo:Any!) -> NatureModel {
        
        var model = NatureModel()
        
        if typeInfo is NSDictionary {
            
            let dict = typeInfo as! NSDictionary
            
            model = NatureModel.mj_object(withKeyValues: dict)
            model.data.block = NatureBlockElemModel.mj_objectArray(withKeyValuesArray: model.data.block)
        }
        
        return model
    }
    
}
