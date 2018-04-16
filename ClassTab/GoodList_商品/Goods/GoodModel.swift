//
//  GoodModel.swift
//  GreateSmart
//
//  Created by Jerod on 2018/4/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 * data 数据层逻辑
 */

class GoodModel: BaseModel {
    @objc var platformItemId : String = ""
    @objc var itemSkuName    : String = ""
    @objc var publicity      : String = ""
    @objc var skuNo          : String = ""
    @objc var image          : String = ""
    @objc var price          : CGFloat = 0.00
    @objc var originalPrice  : CGFloat = 0
    @objc var origin         : String = ""
    @objc var jumpUrl        : String = ""
    @objc var detailUrl      : String = ""
    
    class func modelFromDict(_ dict:NSDictionary) -> GoodModel {
        var model = GoodModel()
        model = GoodModel.mj_object(withKeyValues: dict)
        return model
    }
    
}

/**
 {
 "platformItemId":"item123213123",
 "itemSkuName":"测试商品1每盒24片",
 "publicity":"测试商品介绍",
 "skuNo":"1",
 "image":"http://dacongming-mall-1255436354.cos.ap-shanghai.myqcloud.com/user_head_img/17857714672351368819500729835.jpg?sign=q-sign-algorithm%3Dsha1%26q-ak%3DAKID72i8ICJFOHuHOFvCJDuNcdQzKSL0mbYG%26q-sign-time%3D1523701601%3B1523703401%26q-key-time%3D1523701601%3B1523703401%26q-header-list%3Dhost%26q-url-param-list%3D%26q-signature%3D6b897af845e2ffc2b8a24cee91157bc333d0f61a",
 "price":0.01,
 "originalPrice":9,
 "origin":"老挝",
 "jumpUrl":"localhost://www.laopdr.cn/app/itemSku?sku=1",
 "detailUrl":null
 }
 */
