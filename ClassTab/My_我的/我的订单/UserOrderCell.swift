//
//  UserOrderCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/15.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

let heightUserOrderCell = CGFloat(125)

class UserOrderCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 5
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor.RGBA(83, 83, 83, 0.4).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
