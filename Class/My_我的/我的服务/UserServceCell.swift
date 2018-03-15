//
//  UserServceCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/15.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class UserServceCell: UITableViewCell {

    @IBOutlet weak var backVIew: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backVIew.layer.cornerRadius = 5
        backVIew.layer.borderWidth = 0.5
        backVIew.layer.borderColor = UIColorRGBA(r: 83, g: 83, b: 83, a: 0.4).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
