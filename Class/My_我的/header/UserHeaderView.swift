//
//  UserHeaderView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/15.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class UserHeaderView: UIView,LoadXIBView {

    @IBOutlet weak var backImgView: UIImageView!
    @IBOutlet weak var headIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var levelLabel: UIButton!
    
    typealias IconClickBLK = () -> ()
    /** 头像icon点击回调 */
    var iconClickCB : IconClickBLK?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        levelLabel.layer.cornerRadius = 4
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        headIcon.isUserInteractionEnabled = true
        headIcon.addGestureRecognizer(tap)
    }
    
    @objc func tapAction() -> Void {
        (iconClickCB == nil) ? delog("需要实现iconClickCB") : iconClickCB!()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
