//
//  BannerModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BannerBlockElemModel: BaseModel {
    @objc var imageUrl: String!
    @objc var jumpUrl: String!
}

class BannerModel: BaseModel {

    @objc var data: NSArray!
    @objc var showType: String!
    
    class func dataReader(typeInfo: Any!) -> BannerModel {
        
        var bannerModel = BannerModel()
        
        if typeInfo is NSDictionary {
            let dict = typeInfo as! NSDictionary
            bannerModel = BannerModel.mj_object(withKeyValues: dict)
            bannerModel.data = BannerBlockElemModel.mj_objectArray(withKeyValuesArray: bannerModel.data)
        }
        
        return bannerModel
    }
    
}


