//
//  GoodIntroduceCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class GoodIntroduceCell: UITableViewCell {
    
    @IBOutlet weak var showAllIntroduceBtn: UIButton!
    typealias SHOWBLK = () -> Void
    var zhankaiCB : SHOWBLK?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func showAllIntruduceAction(_ sender: Any) {
        if (zhankaiCB != nil) {
            zhankaiCB!()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
