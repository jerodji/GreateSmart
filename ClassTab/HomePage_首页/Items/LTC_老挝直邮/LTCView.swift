//
//  LTCView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class LTCView: UIView,LoadXIBView {
    
    @IBOutlet weak var imageVIew: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageVIew.layer.cornerRadius = 20
        imageVIew.layer.masksToBounds = true
        imageVIew.frame = CGRect.init(x: itemcellLeft, y: itemcellTop, width: kScreenW-itemcellLeft-itemcellRight, height: heightLTC-itemcellTop-itemcellBottom)
    }
    
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    
    func image(_ url:String) -> Void {
        imageVIew.jj_setImage(url: url, complete: nil)
    }
    
    

}
