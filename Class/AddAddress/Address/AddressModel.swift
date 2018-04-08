//
//  AddressModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AddressModel: BaseModel {
    
    /** 收件人电话 */
    @objc var phonenum  : String = "";
    /** 收件人姓名 */
    @objc var receiver  : String = "";
    
    /** 省 */
    @objc var province  : String = "";
    /** 市 */
    @objc var city      : String = "";
    /** 区 */
    @objc var area      : String = "";
    /** 具体地址 */
    @objc var address   : String = "";
    
    /** Id */
    @objc var adrsId :String = "";
    /** 是否为默认地址 */
    @objc var defaultAddressId:Int = 0;
    
    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
        return ["adrsId":"id"]
    }
    
}
/**
 {
 "id":87,
 "province":"康",
 "city":"泗泾",
 "area":"松江",
 "address":"上海",
 "receiver":"fajkljlk",
 "phonenum":"12313212",
 "defaultAddressId":1
 }
 
 {
 "userId":12,
 "province":"55335",
 "city":"444",
 "area":"3333",
 "address":"长宁区",
 "receiver":"09090",
 "phonenum":"43434"
 }
 */
