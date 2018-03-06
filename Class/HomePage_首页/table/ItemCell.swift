//
//  HomeTabelCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/5.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .green
    }
    
    
    
}
