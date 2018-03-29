//
//  FlowCollectionControl.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/1.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class FlowCollectionControl: BaseControl {
    
    var flowView: FlowCollectionView?
    
    override init() {
        super.init()
    }
    
    func setupFlowCollectionView(frame:CGRect, InteritemSpacing:CGFloat,  LineSpacing:CGFloat, contentInset:UIEdgeInsets, data:NSMutableArray) -> () {
        flowView = FlowCollectionView.init(frame: frame, InteritemSpacing: InteritemSpacing, LineSpacing: LineSpacing, contentInset: contentInset, data: data)
    }

}
