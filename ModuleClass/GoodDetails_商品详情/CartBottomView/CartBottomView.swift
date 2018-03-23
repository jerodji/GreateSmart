//
//  CartBottomView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class CartBottomView: BaseUIView,LoadXIBView {

    @IBOutlet weak var buyButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.layer.cornerRadius = 5
    }
    
    @IBAction func dianpuAction(_ sender: CartBomButton) {
    }
    
    @IBAction func kefuAction(_ sender: CartBomButton) {
    }
    
    @IBAction func shoucang2Action(_ sender: CartBomButton) {
    }
    
    @IBAction func addtoCartACtion(_ sender: UIButton) {
    }
    
    @IBAction func buyRightnowAction(_ sender: UIButton) {
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
