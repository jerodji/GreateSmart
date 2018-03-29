//
//  OrderpayCtrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderpayCtrl: BaseControl {
    var view : OrderpayView?
    
    override init() {
        super.init()
    }
    
    func createView(frame:CGRect) -> Void {
        view = OrderpayView.loadFromXIB()
        view?.frameXib = frame
    }
    
}
