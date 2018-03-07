//
//  BannerModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BannerModel: BaseModel {
    var imageUrl: String?
    var jumpUrl: String?
}

class BannerItemModel: BaseModel {
    var showType: String?
    var data = [BannerModel]() /* 创建一个由特定数据类型构成的空数组 */
}


