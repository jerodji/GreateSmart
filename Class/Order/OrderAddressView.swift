//
//  ShipAddressView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 订单顶部的收货地址 veiw
 */
class OrderAddressView: BaseUIView,LoadXIBView {
    
    @IBOutlet weak var receivePersonLabel: UILabel!
    @IBOutlet weak var receivePhoneNumLabel: UILabel!
    @IBOutlet weak var receiveAddressLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var writeLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
