//
//  NetAPI.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

/** 正式服 https://www.laopdr.cn */
//let URLHEAD = "https://www.laopdr.cn"

/** 测试服 test.laopdr.cn:8080 */
let URLHEAD = "http://test.laopdr.cn:8080"

/** 吴绍康 192.168.1.132:8080 */
//let URLHEAD = "http://192.168.1.132:8080"

/**  李趸玺的电脑  192.168.1.120:8080 */
//let URLHEAD = "http://192.168.1.120:8080"

/** 瞿云康电脑 192.168.1.103:8080 */
//let URLHEAD = "http://192.168.1.103:8080"


class NetAPI: NSObject {
    /** 单例 */
    static let ins = NetAPI()
    /** 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    /** 首页数据 */
    private(set) var homePage = URLHEAD + "/home/homePage"
    
    //MARK:- -------------------- 用 户 --------------------
    
    /// 用户登录/登录验证
    let oauth_token   = URLHEAD + "/oauth/token"
    /// 刷新token
    let refresh_token = URLHEAD + "/oauth/token"
    
    
    //MARK:- -------------------- 地 址 --------------------
    
    /// 添加收货地址
    let addAddress      = URLHEAD + "/userAddress/addAddress"
    /// 收货地址列表
    let getAddresses    = URLHEAD + "/userAddress/getAddresses"
    /// 设置默认收货地址
    let changeDfAddress = URLHEAD + "/userAddress/changeDfAddress"
    /// 修改收货地址
    let updateAddress   = URLHEAD + "/userAddress/updateAddress"
    /// 删除地址
    let removeAddress   = URLHEAD + "/userAddress/removeAddress"
    
    
    
    
    
    
    
    
    
    
}
