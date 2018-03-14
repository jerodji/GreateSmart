//
//  TimeReCCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/14.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class TimeReCCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!  //限量半价
    @IBOutlet weak var remainingLabel: UILabel! //剩余
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = ColorRGBA(r: 83, g: 83, b: 83, a: 0.4).cgColor
        
        //imageView.layer.cornerRadius = 5
        discountLabel.layer.cornerRadius = 3
        discountLabel.layer.masksToBounds = true
    }

}
