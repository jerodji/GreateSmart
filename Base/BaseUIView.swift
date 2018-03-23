//
//  BaseUIView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BaseUIView: UIView {

    private var _frameXib : CGRect?
    var frameXib : CGRect? {
        get {
            return _frameXib
        }
        set {
            _frameXib = newValue
            self.frame = _frameXib!
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
