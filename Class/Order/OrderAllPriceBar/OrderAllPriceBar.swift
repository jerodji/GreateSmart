//
//  OrderAllPriceBar.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/30.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderAllPriceBar: BaseUIView,LoadXIBView {

    @IBOutlet weak var allPriceLab: UILabel!
    @IBOutlet weak var paymentBtn: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        paymentBtn.layer.cornerRadius = 5
    }
    
    @IBAction func paymentAction(_ sender: Any) {
        delog("立即付款")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
