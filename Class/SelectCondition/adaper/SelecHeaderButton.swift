//
//  SelecHeaderButton.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelecHeaderButton: UIButton {
    
    var isZK:Bool = false
    var section:Int?
    var row:Int?
    var cell:SelectConditionCell?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .red
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let wid = CGFloat(18)
        let hei = CGFloat(10)
        let dis = CGFloat(15)
        return CGRect.init(x: self.frame.size.width-dis-wid, y: (self.frame.size.height-hei)/2, width: wid, height: hei)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let dis = CGFloat(15)
        return CGRect.init(x: dis, y: 0, width: self.frame.size.width-dis, height: self.frame.size.height)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
