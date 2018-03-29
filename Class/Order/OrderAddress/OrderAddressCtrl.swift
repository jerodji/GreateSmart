//
//  ShipAddressControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 订单顶部的收货地址 control
 */
class OrderAddressCtrl: BaseControl {
    
    var view : OrderAddressView?
    var defauleAdsModel : AddressModel?
    
    override init() {
        super.init()
        
        view = OrderAddressView.loadFromXIB()
    }
    
    
    
}
