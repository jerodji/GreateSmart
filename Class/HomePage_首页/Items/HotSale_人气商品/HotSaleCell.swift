//
//  HotSaleCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/14.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class HotSaleCell: UIView,LoadXIBView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decsLabel: UILabel!
    @IBOutlet weak var shopButton: UIButton!
//    private var frameRect:CGRect!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = ColorRGBA(r: 83, g: 83, b: 83, a: 0.4).cgColor
    }
    
//    func setFrame(_ frame:CGRect) -> Void {
//        frameRect = frame
//    }
    
    
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//        self.frame = frameRect
//    }
 

}
