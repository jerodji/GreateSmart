//
//  SpecificationCollectionCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/27.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SpecificationCollectionCell: UICollectionViewCell {
    
    var titleLabel: UILabel! = nil
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTitleLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
    }
    
    func setupTitleLabel() -> () {
        if titleLabel==nil {
            titleLabel = UILabel()
            titleLabel.font = UIFont.systemFont(ofSize: 13)
            titleLabel.textColor = UIColor.RGB(183, 183, 183)
            titleLabel.textAlignment = .center
            titleLabel.layer.cornerRadius = 5
            titleLabel.layer.borderWidth = 1
            titleLabel.layer.borderColor = UIColor.RGB(183, 183, 183).cgColor
            
            titleLabel.frame = self.contentView.bounds
            self.contentView.addSubview(titleLabel)
        }
    }
    
    
}
