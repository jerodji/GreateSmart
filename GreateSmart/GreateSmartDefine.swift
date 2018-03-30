//
//  GreateSmartDefine.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/5.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

//MARK: ----------------  color  ----------------

let kColorTabbar = UIColor.white
let kColorNavi   = UIColor.white
let kColorTheme  = UIColor.black /* 主题颜色 */
let kcolor56  = UIColor.RGB(56, 57, 56)
let kcolor183 = UIColor.RGB(183, 183, 183)

//MARK:---------------- item类型 ----------------

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


//MARK: ---------------- 首页不同的 item 高度 ----------------
// 每个item的内边距
let itemcellTop    = CGFloat(10)
let itemcellLeft   = CGFloat(10)
let itemcellBottom = CGFloat(20)
let itemcellRight  = CGFloat(10)

// 标题高度
let heightTitle = CGFloat(30)

// banner高度
let heightBanner = CGFloat(315.0*kSizeScale)

//- 首页 每个item的高度

let heightSortType   = CGFloat(140 * kSizeScale + itemcellTop + itemcellBottom)

let heightLTC        = CGFloat(330 * kSizeScale + itemcellTop + itemcellBottom)

let heightForMale    = CGFloat(108 * kSizeScale + itemcellTop + itemcellBottom)

let heightHotInStore = CGFloat(300 * kSizeScale + itemcellTop + itemcellBottom)

let heightHotSale    = CGFloat(245 + itemcellTop + itemcellBottom)

let widthTimeRecCell = CGFloat(115)
let heightTimeRec    = CGFloat(170 + itemcellTop + itemcellBottom)

let elemHeightBoutique = CGFloat(108 * kSizeScale)
let distanceBoutique = CGFloat(8) //竖向间距是 8
func heightBoutique(elemCount:Int) -> CGFloat {
    if elemCount <= 0 { return 0}
    return CGFloat(itemcellTop + itemcellBottom + elemHeightBoutique*CGFloat(elemCount) + distanceBoutique * CGFloat(elemCount-1) )
}

let elemHeightNature = CGFloat(102 * kSizeScale)
let distanceNature = CGFloat(27)
func heightNature(elemCount:Int) -> CGFloat {
    if elemCount <= 0 {return 0}
    return CGFloat(itemcellTop + itemcellBottom + elemHeightNature*CGFloat(elemCount) + distanceNature * CGFloat(elemCount-1))
}


class GreateSmartDefine: NSObject {
}
