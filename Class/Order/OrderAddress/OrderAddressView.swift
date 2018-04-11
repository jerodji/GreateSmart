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
    
    ///请填写收货地址
    @IBOutlet weak var writeLabel: UILabel!
    
    @IBOutlet weak var enterButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = UIColor.init(r: 183, g: 183, b: 183).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        
        enterButton.isUserInteractionEnabled = false
    }
    

}
