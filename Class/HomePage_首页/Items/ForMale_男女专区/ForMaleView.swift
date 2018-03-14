//
//  ForMaleView.swift
//  GreateSmart
//
//  Created by Jerod on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ForMaleView: UIView , LoadXIBView{

    @IBOutlet weak var leftImgView: UIImageView!
    @IBOutlet weak var rightImgView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        ForMaleView.loadFromXIB()
//
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leftImgView.layer.cornerRadius = 15
        leftImgView.layer.masksToBounds = true
        
        rightImgView.layer.cornerRadius = 15
        rightImgView.layer.masksToBounds = true
        
        let w = (kScreenW - itemcellLeft - itemcellRight - 10)/2
        let h = heightForMale - itemcellTop - itemcellBottom
        leftImgView.frame = CGRect.init(x: itemcellLeft, y: itemcellTop, width: w, height: h)
        rightImgView.frame = CGRect.init(x: leftImgView.right + 10, y: leftImgView.y, width: w, height: h)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
        // Drawing code
        
//        leftImgView.snp.makeConstraints { (make) in
//            make.left.equalTo(self).offset(itemcellLeft)
//            make.top.equalTo(self).offset(itemcellTop)
//            make.bottom.equalTo(self).offset(-itemcellBottom)
//            make.right.equalTo(rightImgView.snp.left).offset(10)
//            make.width.equalTo(rightImgView)
//        }
//
//        rightImgView.snp.makeConstraints { (make) in
//            make.right.equalTo(self).offset(-itemcellRight)
//            make.height.equalTo(leftImgView)
//        }
        
        
        
//    }


}
