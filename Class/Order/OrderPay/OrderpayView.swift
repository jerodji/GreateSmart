//
//  OrderpayView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class OrderpayView: BaseUIView,LoadXIBView {

    /** 优惠券 */
    @IBOutlet weak var couponBtn: CouponButton!
    
    @IBOutlet weak var useCurrencyView: UIView!
    /** 货币,聪明币 */
    @IBOutlet weak var useCurrencyLab: UILabel!
    @IBOutlet weak var useCurrencySwitch: UISwitch!
    
    @IBOutlet weak var integralView: UIView!
    /** 积分 */
    @IBOutlet weak var integralLab: UILabel!
    @IBOutlet weak var integralSwitch: UISwitch!
    
    @IBOutlet weak var payBackView: UIView!
    /** 支付宝支付 */
    @IBOutlet weak var alipayBtn: UIButton!
    /** 微信支付 */
    @IBOutlet weak var wechatPayBtn: UIButton!
    
    @IBOutlet weak var textBackview: UIView!
    @IBOutlet weak var textView: UITextView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        couponBtn.setTitle("优惠券:", for: .normal)
        couponBtn.setImage(UIImage.init(named: "xiaojingru"), for: .normal)
        couponBtn.descriptionLabel.text = ""
        couponBtn.layer.cornerRadius  = 5
        couponBtn.shadow(with: kcolor183.cgColor, opacity: 1, radius: 2, offset: CGSize.init(width: 0, height: 0))
        
        
        useCurrencyView.backgroundColor = UIColor.clear
        useCurrencyView.shadow(with: kcolor183.cgColor, opacity: 1, radius: 2, offset: CGSize.init(width: 0, height: 0))
        useCurrencyLab.text = "   聪明币"
        useCurrencyLab.layer.cornerRadius  = 5
        useCurrencyLab.layer.masksToBounds = true
        
        
        integralView.backgroundColor = UIColor.clear
        integralView.shadow(with: kcolor183.cgColor, opacity: 1, radius: 2, offset: CGSize.init(width: 0, height: 0))
        integralLab.text = "   积分"
        integralLab.layer.cornerRadius  = 5
        integralLab.layer.masksToBounds = true
        
        
        payBackView.layer.cornerRadius = 5
        //payBackView.layer.masksToBounds = true
        payBackView.shadow(with: kcolor183.cgColor, opacity: 1, radius: 2, offset: CGSize.init(width: 0, height: 0))
        
        
        textBackview.layer.cornerRadius = 5
        textBackview.shadow(with: kcolor183.cgColor, opacity: 1, radius: 2, offset: CGSize.init(width: 0, height: 0))
        textView.isUserInteractionEnabled = true
    }
    
    @IBAction func couptionAction(_ sender: Any) {
        delog("优惠券")
    }
    
    @IBAction func useCurrencySwitchAction(_ sender: Any) {
        delog("聪明币switch")
    }
    
    @IBAction func integralSwitchAction(_ sender: Any) {
        delog("积分switch")
    }
    
    @IBAction func alipayAction(_ sender: Any) {
        delog("点击了支付宝支付")
    }
    
    @IBAction func wechatPayAction(_ sender: Any) {
        delog("点击了微信支付")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
