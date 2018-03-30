//
//  OrderpayCtrl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderpayCtrl: BaseControl,UITextViewDelegate {
    var view : OrderpayView?
    
    override init() {
        super.init()
    }
    
    func createView(frame:CGRect) -> Void {
        view = OrderpayView.loadFromXIB()
        view?.frameXib = frame
        view?.couponBtn.descriptionLabel.text = "未选择"
        view?.useCurrencyLab.text = "   可使用xxx聪明币"
        view?.integralLab.text = "   可使用xxx积分"
        view?.textView.delegate = self
        //view?.textView.becomeFirstResponder()
    }
    
    //MARK: text delegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        delog("1")
    }
    
}
