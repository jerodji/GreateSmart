//
//  SelecHeaderButton.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SelecHeaderButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: self.frame.size.width-30-15, y: (self.frame.size.height-30)/2, width: 30, height: 30)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 15, y: 0, width: self.frame.size.width-15, height: self.frame.size.height)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
