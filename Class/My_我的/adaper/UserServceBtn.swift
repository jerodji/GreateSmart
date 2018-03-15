//
//  UserServceBtn.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/15.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class UserServceBtn: UIButton {

    var numberLabel : UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() -> Void {
        
        numberLabel = UILabel.init()
        numberLabel.frame = CGRect.init(x: 3, y: self.bounds.size.height-3-20-35, width: self.bounds.size.width-3-3, height: 35)
        numberLabel.textAlignment = .center
        numberLabel.backgroundColor = UIColor.red
        self.addSubview(numberLabel)
        
        self.titleLabel?.textAlignment = .center
    }
    
//    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
//        return CGRect.init(x: (self.bounds.size.width-25)/2, y: (self.bounds.size.height-3-20-25)/2, width: 25, height: 25)
//    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 3, y: self.bounds.size.height-3-20, width: self.bounds.size.width-3-3, height: 20)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
