//
//  GoodsListColtrol.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/16.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class GoodsListColtrol: BaseControl {

    var leftView : LeftGoodsView!
    var rightView: RightGoodsView!
    
    
    override init() {
        super.init()
        
        leftView = LeftGoodsView()
        rightView = RightGoodsView()
        
    }
    
}
