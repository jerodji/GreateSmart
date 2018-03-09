//
//  SortTypeModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/9.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit


class SortTypeModel: BaseModel {
    
    @objc var block: NSMutableArray = [SortTypeBlockElementModel]() as! NSMutableArray
    //@objc var block = [SortTypeBlockElementModel]()
    @objc var smallTitle: String = ""
    @objc var title: String = ""
    
}

class SortTypeBlockElementModel: BaseModel {
    @objc var imageUrl = ""
    @objc var jumpUrl = ""
}
