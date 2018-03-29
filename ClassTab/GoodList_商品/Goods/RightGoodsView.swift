//
//  RightGoodsView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/16.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class RightGoodsView: UICollectionView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init(frame:CGRect) {
        let lay = UICollectionViewFlowLayout.init()
        lay.scrollDirection = .vertical
        lay.minimumInteritemSpacing = 15
        lay.itemSize = CGSize.init(width: 175*kSizeScale, height: 255*kSizeScale)
        
        self.init(frame: frame, collectionViewLayout: lay)
        
        self.backgroundColor = UIColor.white
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
