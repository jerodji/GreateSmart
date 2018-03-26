//
//  AcountGoodCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class AcountGoodCell: UITableViewCell {

    typealias SelecBLK = () -> ()
    var selecBtnCB : SelecBLK?
    
    /** 选中/取消选中按钮 */
    @IBOutlet weak var selecBtn: UIButton!
    /** 商品图片 */
    @IBOutlet weak var goodImgView: UIImageView!
    /** 商品名字 */
    @IBOutlet weak var nameLabel: UILabel!
    /** 单价 */
    @IBOutlet weak var priceLabel: UILabel!
    /** 规格 */
    @IBOutlet weak var specificationLabel: UILabel!
    /** 数量 */
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func selecAction(_ sender: UIButton) {
        (nil != selecBtnCB) ? selecBtnCB!() : delog("需要实现block")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
