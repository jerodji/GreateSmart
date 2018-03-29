//
//  SortingView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/16.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SortingView: UIView,LoadXIBView {

    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var salesBtn: SortButton!
    @IBOutlet weak var priceBtn: SortButton!
    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var selectBtn: UIButton!
    
    typealias BTNBLK = (Int)->()
    var clickCB : BTNBLK?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        allBtn.tag    = 0
        salesBtn.tag  = 1
        priceBtn.tag  = 2
        newBtn.tag    = 3
        selectBtn.tag = 4
        
        self.layer.shadowColor = UIColor.init(r: 83, g: 83, b: 83).cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 2
        //self.layer.shadowOffset = CGSize.init(width: 0, height: 2)
        self.layer.shadowPath = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 2, width: self.bounds.size.width, height: self.bounds.size.height+2), cornerRadius: 0).cgPath
        self.layer.shouldRasterize = true //设置缓存
        self.layer.rasterizationScale = UIScreen.main.scale //设置抗锯齿边缘
        
        salesBtn.jj_setTitle("销量")
        salesBtn.jj_setUpImage(name: "shang", heighName: "shang2")
        salesBtn.jj_setDownImage(name: "xia", heighName: "xia2")
        //salesBtn.jj_setBackgroundColor(color: .white, heighColor: .black)
        
        priceBtn.jj_setTitle("价格")
        priceBtn.jj_setUpImage(name: "shang", heighName: "shang2")
        priceBtn.jj_setDownImage(name: "xia", heighName: "xia2")
        //priceBtn.jj_setBackgroundColor(color: .white, heighColor: .black)
    }
    
    @IBAction func allAction(_ sender: UIButton) {
        if clickCB != nil {
            clickCB!(sender.tag)
        }
    }
    
    @IBAction func salesAction(_ sender: SortButton) {
        if clickCB != nil {
            clickCB!(sender.tag)
        }
    }
    
    @IBAction func priceBtnAction(_ sender: SortButton) {
        if clickCB != nil {
            clickCB!(sender.tag)
        }
    }
    
    @IBAction func newGoodAction(_ sender: UIButton) {
        if clickCB != nil {
            clickCB!(sender.tag)
        }
    }
    
    @IBAction func selectConditionAction(_ sender: Any) {
        if clickCB != nil {
            clickCB!((sender as! UIButton).tag)
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
