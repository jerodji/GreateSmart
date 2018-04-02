//
//  NetworkManage.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit
import KeychainAccess

class NetHttp: NSObject {
    /** 单例 */
    static let ins = NetHttp()
    /** 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    /** 获取 token拼接的表单头 */
    func getFromHeaderAuthorization() -> NSDictionary {
        var formHeaderDict : NSDictionary = ["Authorization" : ""]
        if Keychain(service:kBundleID)[UserTokenKeys.ins.token_type] != nil {
            let tokenInfo: String = "\(Keychain(service:kBundleID)[UserTokenKeys.ins.token_type]!)" + " " + "\(Keychain(service: kBundleID)[UserTokenKeys.ins.access_token]!)"
            formHeaderDict = ["Authorization":tokenInfo]
        }
         return formHeaderDict
    }
    
//    // @escaping 标记为 逃逸闭包
//    open func requestHomePageData(info:@escaping (Any)->()) -> Void {
//        let url = URLHEAD + NetAPI.ins.homePage
//
//    }
    
    //MARK:登录验证
    func requestOAuthToken(formBody:NSDictionary?, info: @escaping (Any)->() ) -> Void {
        
        let url = URLHEAD + NetAPI.ins.oauth_token
        NetworkHUD.shareIns().request(.POST, url: url, formHeaders: nil, formBody: formBody as! [AnyHashable:Any], success: { (res) in
            info(res!)
            
        }, fail: { (task, error) in
            NetError.handleInfo(task: task, error: error as NSError?)
        }, showHUD: true)
        
    }
    
    //MARK:添加收货地址
    /**
     {
         "isdefalut":1,
         "userAddress":{
             "address":"上海",
             "area":"松江",
             "city":"泗泾",
             "phonenum":"12313212",
             "province":"康",
             "receiver":"fajkljlk"
         }
     }
     */
    func addAddress(params:NSDictionary?) -> Void {
        let url = URLHEAD + NetAPI.ins.addAddress
        
        NetworkHUD.shareIns().request(.POST, url: url, formHeader: getFromHeaderAuthorization() as! [AnyHashable : Any], params: params as! [AnyHashable : Any], success: { (res) in
            delog(res)
            
        }, fail: { (task, error) in
            delog(error)
        }, showHUD: true)
    }
    
    
    
    
    
    
}
