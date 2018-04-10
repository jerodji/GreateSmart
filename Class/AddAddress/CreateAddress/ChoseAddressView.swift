//
//  ChoseAddressView.swift
//  GreateSmart
//
//  Created by hailin on 2018/4/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

private let pickerW = kScreenW
private let pickerH = CGFloat(200 + kHomeIndicatorH)
private let pickerX = CGFloat(0)
private let pickerY = (kScreenH-pickerH)

class ChoseAddressView: BaseUIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var picker : AddressPicker = AddressPicker.init()
    
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        picker.initView(frame: CGRect(x: pickerX, y: pickerY, width: pickerW, height: pickerH))
        self.addSubview(picker.view!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
