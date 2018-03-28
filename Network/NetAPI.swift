//
//  NetAPI.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/**
 *  正式服 https://www.laopdr.cn/
 */
//let URLHEAD = "https://www.laopdr.cn/"

/**
 *  测试服 http://test.laopdr.cn:8080/
 */
let URLHEAD = "http://test.laopdr.cn:8080/"

/**
 *  li dun xi  http://192.168.1.120:8080/
 */
//let URLHEAD = "http://192.168.1.120:8080/"


class NetAPI: NSObject {
    /** 单例 */
    static let ins = NetAPI()
    /** 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    let test_fail = "test-fail"
    let test_error = "test-error"
    let test_entity = "test-entity"
    
    /** 首页数据 */
    private(set) var homePage = "home/homePage"
    
    /** 用户登录/登录验证 */
    let oauth_token = "oauth/token"
    
    
    
    
}
