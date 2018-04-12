//
//  PCAModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/4/10.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ProvinceModel: BaseModel {
    @objc var provinceId: Int32 = 0
    @objc var provinceName: String = ""
    @objc var cityArray : NSMutableArray = []
}

class CityModel: BaseModel {
    @objc var cityId : Int32 = 0
    @objc var provinceId : Int32 = 0
    @objc var cityName : String = ""
    @objc var zipCode : String = ""
    @objc var areaArray : NSMutableArray = []
}

class AreaModel: BaseModel {
    @objc var areaId : Int32 = 0
    @objc var cityId : Int32 = 0
    @objc var areaName : String = ""
}
