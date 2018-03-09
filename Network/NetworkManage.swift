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
    
    func testEntityParamsRequest(entity:Any) -> Void {
        BaseAFNetwork.instance.request(type: RequestType.POST, fullURL: "http://192.168.1.126:18080/test-entity", paramsEntity: entity) { (res) in
            delog(res)
        }
    }
    
    open func requestHomePageData(info:@escaping (Any)->()) -> Void {
        BaseAFNetwork.instance.POST(api: NetAPI.instance.homePage, params: nil) { (res) in
            info(res)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
