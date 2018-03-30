//
//  OrderDiscount.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/30.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class CouponButton: UIButton {
    
    /** 右边描述 */
    var descriptionLabel: UILabel = UILabel.init()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() -> Void {
        self.titleLabel?.textAlignment = .left
        self.titleLabel?.textColor = kcolor56
        self.titleLabel?.font = UIFont.init(name: fontPingFangSCMedium, size: 14)
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textColor = kcolor183
        descriptionLabel.textAlignment = .right
        self.addSubview(descriptionLabel)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let h = self.bounds.size.height
        let w = self.bounds.size.width
        return CGRect.init(x: 10, y: 0, width: w-10-40, height: h)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let h = self.bounds.size.height
        let w = self.bounds.size.width
        descriptionLabel.frame = CGRect.init(x: 10, y: 0, width: w-10-40, height: h)
        return CGRect.init(x: w-20-6, y: (h-10)/2, width: 6, height: 10)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
