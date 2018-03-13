//
//  ItemTitleView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ItemTitleView: UIView,LoadXIBView {

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var smailTitleLab: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        moreBtn.isHidden = true
    }
    
    func showMoreButton(_ isShow:Bool) -> Void {
        if isShow {
            moreBtn.isHidden = false
        } else {
            moreBtn.isHidden = true
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
 

}
