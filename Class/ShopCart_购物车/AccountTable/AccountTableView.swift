//
//  AccountTableView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AccountTableView: BaseUITableView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    
    func setupUI() -> Void {
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.RGB(240, 240, 240).cgColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
    }
    
}
