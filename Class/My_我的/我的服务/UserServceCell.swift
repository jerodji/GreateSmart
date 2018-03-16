//
//  UserServceCell.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/15.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

let heightUserServceCell = CGFloat(240)


class UserServceCell: UITableViewCell {

    @IBOutlet weak var backVIew: UIView!
    let names = ["优惠券","聪明币","我的积分","我的消息","商品收藏","店铺收藏","资讯收藏","浏览记录","地址管理","意见反馈","我的会员","二维码"]
    let icons = ["dizhi","yijianfankui","wodehuiyuan","erweima"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backVIew.layer.cornerRadius = 5
        backVIew.layer.borderWidth = 0.5
        backVIew.layer.borderColor = UIColorRGBA(r: 83, g: 83, b: 83, a: 0.4).cgColor
        
        let wid = (kScreenW-20-20)/4
        
        for index in 0...7 {
            let btn = UserServceBtn.init(frame: CGRect(x: 10 + wid*CGFloat(index%4), y: (36+CGFloat(index/4))+(65*CGFloat(index/4)), width: wid, height: 65))
            btn.setTitle(names[index], for: UIControlState.normal)
            btn.setTitleColor(UIColorRGB(r: 39, g: 39, b: 39), for: .normal)
            btn.numberLabel.text = "666"
            if index > 3 {
                btn.numberLabel.textColor = .red
            }
            btn.tag = index
            backVIew.addSubview(btn)
        }
        
        for index in 8...11 {
            let i = index-8
            let btn = UserCenterButton.init(frame: CGRect(x: 10+wid*CGFloat(i), y: 169, width: wid, height: 65))
            btn.setTitle(names[index], for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setImage(UIImage.init(named: icons[i]), for: .normal)
            //btn.setBackgroundImage(UIImage.init(named: names[i]), for: .normal)
            btn.tag = index
            backVIew.addSubview(btn)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
