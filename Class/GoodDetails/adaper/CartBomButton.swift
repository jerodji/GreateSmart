//
//  CartBomButton.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class CartBomButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private let wd = CGFloat(20)
    private let hg = CGFloat(19)
    private let titleH = CGFloat(20)
    
    func setupUI() -> Void {
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = UIFont.systemFont(ofSize: 11)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: (self.bounds.size.width-wd)/2, y: 5+(self.bounds.size.height-titleH-wd)/2, width: wd, height: hg)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect.init(x: 0, y: self.bounds.size.height-titleH, width: self.bounds.size.width, height: titleH)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
