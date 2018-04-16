//
//  GoodCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/16.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class GoodCell: UICollectionViewCell,LoadXIBView {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var decsLabel: UILabel!
    @IBOutlet weak var shopButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.shadowColor = UIColor.init(r: 83, g: 83, b: 83).cgColor
        backView.layer.shadowOpacity = 0.4
        backView.layer.shadowRadius = 2
        //self.layer.shadowOffset = CGSize.init(width: -2, height: 2)
        backView.layer.shadowPath = UIBezierPath.init(roundedRect: CGRect.init(x: -0.5, y: 2, width: backView.bounds.size.width*kSizeScale, height: backView.bounds.size.height*kSizeScale), cornerRadius: 10).cgPath
        backView.layer.cornerRadius = 10
        
        //backView.layer.masksToBounds = true //以上的设置无效了
        
        //self.layer.shouldRasterize = true //设置缓存
        //self.layer.rasterizationScale = UIScreen.main.scale //设置抗锯齿边缘

    }
    
    override func draw(_ rect: CGRect) {
        //绘制圆角
        imageView.addCorner(corners: [.topLeft, .topRight], radii: 10)
    }
    
}
