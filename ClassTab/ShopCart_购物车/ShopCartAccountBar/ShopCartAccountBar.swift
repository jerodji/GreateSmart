//
//  ShopCartAccountBar.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ShopCartAccountBar: BaseUIView,LoadXIBView {
    
    /** 总价label */
    @IBOutlet weak var allPriceLab: UILabel!
    /** 结算buttond */
    @IBOutlet weak var accountBtn: UIButton!
    
    @IBAction func accountAction(_ sender: UIButton) {
        let vc = OrderVC()
        vc.hidesBottomBarWhenPushed = true /** 隐藏tbbar */
        self.viewController().navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
