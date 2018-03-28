//
//  NetworkManage.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class NetworkManage: NSObject {
    /** 单例 */
    static let ins = NetworkManage()
    /** 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
//    func testEntityParamsRequest(entity:Any) -> Void {
//        BaseAFNetwork.ins.request(type: NetType.POST, fullURL: "http://192.168.1.126:18080/test-entity", paramsEntity: entity) { (res) in
//            delog(res)
//        }
//    }

    // @escaping 标记为 逃逸闭包
    open func requestHomePageData(info:@escaping (Any)->()) -> Void {
        let url = URLHEAD + NetAPI.ins.homePage
        AFBaseNetwork.shared().request(.POST, url: url, paramsDict: nil, success: { (res) in
            info(res!)
        }, fail: { (task, error) in
            ErrorCodeHandle.handleInfo(task: task, error: error as NSError?)
        })
        
//        BaseAFNetwork.ins.POST(urlHead: URLHEAD ,api: NetAPI.ins.homePage, params: nil) { (res) in
//            info(res)
//        }
    }
    
    /** 登录验证 */
    func requestOAuthToken(formBody:NSDictionary?, info: @escaping (Any)->() ) -> Void {
        let url = URLHEAD + NetAPI.ins.oauth_token
        JJNetwork.shareIns().request(.POST, url: url, formHeaders: nil, body: formBody as! [AnyHashable:Any], params: nil, success: { (res) in
            info(res!)
        }, fail: { (task, error) in
            ErrorCodeHandle.handleInfo(task: task, error: error as NSError?)
        })
    }
    
    
    
    
    
    
    
    
    
}
