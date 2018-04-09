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
    
    var scene : OrderVC?
    var view : OrderAddressView?
    var adrsModel : AddressModel?
    
    override init() {
        super.init()
        
        view = OrderAddressView.loadFromXIB()
        
    }
    
    func setScene(vc:OrderVC,viewTapSel:Selector) -> Void {
        scene = vc
        let tap = UITapGestureRecognizer.init(target: scene, action: viewTapSel)
        view?.addGestureRecognizer(tap)
    }
    
    func configView() -> Void {
        if adrsModel == nil {
            view?.writeLabel.isHidden = false
            view?.receivePersonLabel.isHidden = true
            view?.receivePhoneNumLabel.isHidden = true
            view?.receiveAddressLabel.isHidden = true
        }
        else{
            view?.writeLabel.isHidden = true
            view?.receivePersonLabel.isHidden = false
            view?.receivePhoneNumLabel.isHidden = false
            view?.receiveAddressLabel.isHidden = false
            
            view?.receivePersonLabel.text = adrsModel!.receiver
            view?.receivePhoneNumLabel.text = adrsModel!.phonenum
            view?.receiveAddressLabel.text = adrsModel!.province + adrsModel!.city + adrsModel!.area + adrsModel!.address
        }
    }
    
}
