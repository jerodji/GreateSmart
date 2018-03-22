//
//  SelecHeadView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/22.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit


/**
 分类标题view
 */
class SelecHeadView: UIView {

    var btn : SelecHeaderButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        btn = SelecHeaderButton.init(frame: CGRect.init(x: 15, y: 10, width: kScreenW-30, height: 60))
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        self.addSubview(btn)
    }
    
    func setHeadTitle(_ model:SelectConditionModel) -> Void {
        btn.setTitle(model.name, for: .normal)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
