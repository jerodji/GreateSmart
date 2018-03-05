//
//  NetworkManage.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class NetworkManage: NSObject {
    /* 单例 */
    static let instance = NetworkManage()
    /* 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    open func requestHomePageData(index:Int) -> (NSDictionary) {
        delog(NetAPI.instance.homePage)
        return ["data":"home page data"]
    }
}
