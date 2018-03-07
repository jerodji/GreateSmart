//
//  NetAPI.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

//let URLHEAD = "https://www.laopdr.cn"
//let URLHEAD = "http://test.laopdr.cn:8080" /* test */
let URLHEAD = "http://192.168.1.126:18080" /* li dun xi */


class NetAPI: NSObject {
    /* 单例 */
    static let instance = NetAPI()
    /* 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    let test_fail = "test-fail"
    let test_error = "test-error"
    
    /* 首页数据 */
    private(set) var homePage = "home/homePage"
    
    
    
}
