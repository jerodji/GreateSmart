//
//  JJLayoutColectionColtrol.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/26.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class SpecificationColectionControl: BaseControl,UICollectionViewDataSource,UICollectionViewDelegate {

    var view : JJLayoutColectionView?
    
    init(frame:CGRect, InteritemSpacing:CGFloat,  LineSpacing:CGFloat, contentInset:UIEdgeInsets) {
        super.init()
        view = JJLayoutColectionView.init(frame: frame, InteritemSpacing: InteritemSpacing, LineSpacing: LineSpacing, contentInset: contentInset)
        view!.delegate = self
        view!.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
