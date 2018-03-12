//
//  BannerModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

//class BannerElemModel: BaseModel {
//    @objc var imageUrl: String?
//    @objc var jumpUrl: String?
//}

class BannerModel: BaseModel {
//    @objc var showType: String?
//    @objc var data = [BannerElemModel]() /* 创建一个由特定数据类型构成的空数组 */
    @objc var data: NSArray!
    
    
    class func dataReader(data: Any!) -> BannerModel {
        
        let bannerModel = BannerModel()
        
        if data is NSArray {
            let array: NSArray = data as! NSArray
            bannerModel.data = array
        }
        
        return bannerModel
    }
    
}


