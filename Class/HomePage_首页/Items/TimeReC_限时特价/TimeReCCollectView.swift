//
//  TimeReCCollectView.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/14.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class TimeReCCollectView: UICollectionView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.frame = frame
        self.backgroundColor = UIColor.white
    }
    
    convenience init(frame:CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(itemcellTop, itemcellLeft, itemcellBottom, itemcellRight)
        layout.minimumLineSpacing = 10 //行间距
        layout.itemSize = CGSize.init(width: widthTimeRecCell, height: heightTimeRec-itemcellBottom-itemcellTop)
        layout.scrollDirection = .horizontal
        
        self.init(frame: frame, collectionViewLayout: layout)
        
    }
    
    
}
