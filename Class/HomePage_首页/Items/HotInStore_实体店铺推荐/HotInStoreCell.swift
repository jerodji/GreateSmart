//
//  HotInStoreCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/14.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotInStoreCell: UICollectionViewCell,LoadXIBView {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
