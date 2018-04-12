//
//  ChoseAddressView.swift
//  GreateSmart
//
//  Created by hailin on 2018/4/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

private let pickerW = kScreenW
private let pickerH = CGFloat(200)
private let pickerX = CGFloat(0)
private let pickerY = (kScreenH - kTabbarH - pickerH)

class ChoseAddressView: BaseUIView {

    var picker : AddressPicker = AddressPicker.init()
    
    typealias SureAreaBLK = (String)->()
    var areaCb : SureAreaBLK?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        picker.initView(pickerFrame: CGRect(x: pickerX, y: kScreenH, width: pickerW, height: pickerH))
        self.addSubview(picker.view!)
        self.addSubview(picker.sureBtn!)
        
        UIView.animate(withDuration: 0.4) {
            self.picker.view!.origin = CGPoint(x: 0, y: pickerY)
            self.picker.sureBtn!.origin = CGPoint(x: 0, y: pickerY + pickerH)
        }
        
        picker.sureCb = { area in
            (self.areaCb == nil) ? delog("没有实现areaCb") : self.areaCb!(area)
            self.removeView()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        removeView()
    }
    
    func removeView() -> Void {
        self.picker.view?.removeFromSuperview()
        self.picker.sureBtn?.removeFromSuperview()
        self.picker.view = nil
        self.picker.sureBtn = nil
        self.removeFromSuperview()
    }
}
