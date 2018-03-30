//
//  OrderGoodlistTableView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderGoodlistTableView: BaseUITableView {
    
    
    private var frameRect : CGRect?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        frameRect = frame
        self.frame = frameRect!
        self.backgroundColor = UIColor.white
        //圆角
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        //阴影
        self.shadow(with: UIColor(r: 183, g: 183, b: 183).cgColor, opacity: 1, radius: 2, offset: CGSize.init(width: 0, height: 0))
        self.clipsToBounds = false /** tableview 的 clipsToBounds 默认为yes, 会将阴影裁减掉 */
        
        
    }
    
    
    
    
}
