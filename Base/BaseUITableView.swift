//
//  BaseUITableView.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BaseUITableView: UITableView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configSeparator()
        adapter()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        configSeparator()
        adapter()
    }
    
    func configSeparator() -> () {
        self.separatorStyle = UITableViewCellSeparatorStyle.singleLine /* 分割线样式 */
        //self.separatorColor = UIColor.init(hex: "F1F1F1")  /* 设置分割线颜色 */
        self.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0) /* 分割线内边距 */
    }
    
    //适配
    func adapter() -> () {
        if #available(iOS 11, *) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.automatic
        }
    }
    
    
}
