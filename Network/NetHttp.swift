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
    func formHeaderAuthorization() -> [AnyHashable : Any] {
        
        var formHeaderDict : [AnyHashable : Any] = ["Authorization" : ""]
        
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
    
    //MARK:- ***************************   用 户   ***************************
    /**
     登录验证
     [
         "grant_type"   :"password",
         "username"     :String(describing: phoneNumberTF.text!),
         "password"     :String(describing: passwordTF.text!),
         "scope"        :"app",
         "client_id"    :"client",
         "client_secret":"secret"
     ]
     */
    func OAuthToken(formBody:NSDictionary?, info: @escaping (Any)->() ) -> Void {
        
        NetworkHUD.shareIns().request(.POST, url: NetAPI.ins.oauth_token, formHeaders: nil, formBody: formBody as! [AnyHashable:Any], success: { (res) in
            info(res!)
            
        }, fail: { (task, error) in
            NetError.handleInfo(task: task, error: error as NSError?)
        }, showHUD: true)
        
    }
    
    
    
    //MARK:- ***************************   地 址   ***************************
    /**
     添加收货地址
     参数:
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
        
        NetworkHUD.shareIns().request(.POST, url: NetAPI.ins.addAddress, formHeader: formHeaderAuthorization(), params: params as! [AnyHashable : Any], success: { (res) in
//            delog(res)
        }, fail: { (task, error) in
            NetError.handleInfo(task: task, error: error as NSError?)
        }, showHUD: true)
    }
    
    /** 收货地址列表 */
    func getAddresses(pageNo:Int, pageSize:Int, info: @escaping (Any)->Void) -> Void {
        NetworkHUD.shareIns().request(.POST, url: NetAPI.ins.getAddresses, formHeader: formHeaderAuthorization(), params: ["pageNo":pageNo,"pageSize":pageSize], success: { (res) in
            info(res!)
        }, fail: { (task, error) in
             NetError.handleInfo(task: task, error: error as NSError?)
        }, showHUD: true)
    }
    
    
    
    
}
