//
//  AddToCartView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 加入购物车视图
 */
class AddToCartView: BaseUIView,LoadXIBView {
    
    @IBOutlet weak var topSpaceBtn: UIButton!
    @IBOutlet weak var goodView: UIView!
    @IBOutlet weak var goodImgView: UIImageView!
    @IBOutlet weak var goodPriceLab: UILabel!
    @IBOutlet weak var selecLab: UILabel!
    @IBOutlet weak var configTableView: AddCartGoodConfigTableView!
    
    @IBAction func topSpaceButtonAction(_ sender: UIButton) {
        moveOut()
    }
    
    func moveOut() -> Void {
        UIView.animate(withDuration: 0.5) {
            self.frame = CGRect.init(x: 0, y: kScreenH, width: kScreenW, height: kScreenH)
        }
    }
    
    typealias SUREBLK = () -> ()
    var sureBtnCB : SUREBLK?
    @IBAction func clickSureAction(_ sender: UIButton) {
        (sureBtnCB != nil) ? sureBtnCB!() : delog("需要实现sureBtnCB")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.frame = CGRect.init(x: 0, y: kScreenH, width: kScreenW, height: kScreenH)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapGoodAction))
        goodView.addGestureRecognizer(tap)
    }
    
    @objc func tapGoodAction() -> Void {
        delog("")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
