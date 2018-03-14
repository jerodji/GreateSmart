//
//  GreateSmartDefine.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/5.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

// item类型
public enum ShowTypeENUM: String {
    case NewBanner   = "NewBanner"
    case SortType    = "SortType"
    case HotInStore  = "HotInStore"
    case ForMale     = "ForMale"
    case HotSale     = "HotSale"
    case Nature      = "Nature"
    case TimeReC     = "TimeReC"
    case Boutique    = "Boutique"
    case LTC         = "LTC"
    case NewBlock1   = "NewBlock1"
    case Nature2     = "Nature2"
}

// 每个item的内边距
let itemcellTop = CGFloat(10)
let itemcellLeft = CGFloat(10)
let itemcellBottom = CGFloat(20)
let itemcellRight = CGFloat(10)

// 标题高度
let heightTitle = CGFloat(30)
// banner高度
let heightBanner = CGFloat(315.0*kSizeScale)
// 每个item的高度
let heightSortType = CGFloat(140*kSizeScale + itemcellTop + itemcellBottom)
let heightLTC = CGFloat(330*kSizeScale + itemcellTop + itemcellBottom)
let heightForMale = CGFloat(200*kSizeScale + itemcellTop + itemcellBottom)




class GreateSmartDefine: NSObject {
}
