//
//  GreateSmartDefine.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/5.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit


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

let itemcellTop = CGFloat(10)
let itemcellBottom = CGFloat(20)
let itemcellLeft = CGFloat(10)
let itemcellRight = CGFloat(10)

let heightTitle = CGFloat(30)
let heightBanner = CGFloat(315.0*kSizeScale)
let heightSortType = CGFloat(140*kSizeScale)

//protocol HomeTableViewDelegate {
//    func tableScrolDidScrol(_ scrollView: UIScrollView) -> Void
//}


class GreateSmartDefine: NSObject {
}
