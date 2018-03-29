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
class OrderAddressControl: BaseControl {
    
    var view : OrderAddressView?
    var defauleAdsModel : AddressModel?
    
    init(viewFrame:CGRect) {
        super.init()
        
        view = OrderAddressView.loadFromXIB()
        view?.frameXib = viewFrame
        
    }

    
}
