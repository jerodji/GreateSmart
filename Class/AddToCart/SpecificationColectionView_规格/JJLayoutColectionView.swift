//
//  SpecificationColectionView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class JJLayoutColectionView: UICollectionView {

    private let layout = WSCollectionViewFlowLayout()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame:CGRect, InteritemSpacing:CGFloat,  LineSpacing:CGFloat, contentInset:UIEdgeInsets) {
        
        layout.minimumInteritemSpacing = InteritemSpacing
        layout.minimumLineSpacing = LineSpacing
        layout.contentInset = contentInset
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = UIColor.clear
        self.showsVerticalScrollIndicator = false
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
