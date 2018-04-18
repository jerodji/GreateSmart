//
//  BoutiqueView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/14.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BoutiqueView: UIView {

    private var elemWidth:CGFloat = kScreenW - itemcellLeft - itemcellRight
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame:CGRect,count:Int) {
        super.init(frame: frame)
        elemWidth = frame.size.width - itemcellLeft - itemcellRight
    }
    
    func setModel(model:BoutiqueModel) -> Void {
        
        for i in 0...model.data.block.count-1 {
            
            let imgView = UIImageView.init(frame: CGRect.init(x: itemcellLeft, y: itemcellTop + CGFloat(i)*(elemHeightBoutique + distanceBoutique), width: elemWidth, height: elemHeightBoutique))
            imgView.layer.cornerRadius = 5
            imgView.layer.masksToBounds = true
            imgView.jj_setImage(url: (model.data.block[i] as! BoutiqueBlockElemModel).imageUrl)
            self.addSubview(imgView)
            
        }
    }

}
