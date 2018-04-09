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
    
    /** 请求队列 */
    //var requestQueue : NSMutableDictionary = [:]
    
    /** 记录登录失败后重复登录的次数 */
    var loginNum : Int = 0
    
    
    //MARK:获取 拼接token的 表单头
    func formHeaderAuthorization() -> [AnyHashable : Any] {
        
        var formHeaderDict : [AnyHashable : Any] = ["Authorization" : ""]
        
        if Keychain(service:kBundleID)[KeychainKeys.ins.token_type] != nil {
            let tokenInfo: String = "\(Keychain(service:kBundleID)[KeychainKeys.ins.token_type]!)" + " " + "\(Keychain(service: kBundleID)[KeychainKeys.ins.access_token]!)"
            formHeaderDict = ["Authorization":tokenInfo]
        }
        
        return formHeaderDict
    }
    
    
    //MARK:- -------------------- token验证 --------------------
    /// 登录验证
    func OAuthToken(formBody:NSDictionary?, info: @escaping (Any)->() ) -> Void {
        
        NetworkHUD.shareIns().formRequest(.POST, url: NetAPI.ins.oauth_token, formHeaders: nil, formBody: formBody as! [AnyHashable:Any], success: { (task,res) in
            
            if res is NSDictionary {
                let dict = res as! NSDictionary
                delog(dict)
                /**
                 *  keychain 存储token信息
                 */
                let keys : NSArray = dict.allKeys as NSArray
                for index in 0...keys.count-1  {
                    Keychain(service: kBundleID)[keys[index] as! String] = String.init(describing: dict[keys[index] as! String]!)
                }
                
            }
            
            info(res!)
            
        }, fail: { (task, error) in
            
            //登录失败后重复三次
            if self.loginNum < 3 {
                self.loginNum += 1
                self.OAuthToken(formBody: formBody, info: info)
            } else {
                self.loginNum = 0
                delog("登录失败")
//                NetError.ins.handleInfo(task: task, error: error as NSError?)
            }
            
        }, showHUD: true)
        
    }
    
    /// 刷新token
    func refreshToken(info: @escaping (Any)->() ) -> Void {
        
        let refresh_token = "\(Keychain(service: kBundleID)[KeychainKeys.ins.refresh_token] ?? "")"
        let body: [AnyHashable:Any] = [
            "grant_type"   :"refresh_token",
            "scope"        :"app",
            "client_id"    :"client",
            "client_secret":"secret",
            "refresh_token":refresh_token
        ]
        
        NetworkHUD.shareIns().formRequest(.POST, url: NetAPI.ins.refresh_token, formHeaders: nil, formBody: body , success: { (ponse,data) in
            
            if data is NSDictionary {
                let dict = data as! NSDictionary
                delog(dict)
                /**
                 *  keychain 存储token信息
                 */
                let keys : NSArray = dict.allKeys as NSArray
                for index in 0...keys.count-1  {
                    Keychain(service: kBundleID)[keys[index] as! String] = String.init(describing: dict[keys[index] as! String]!)
                }
            }
            
            if data != nil {
                delog("token刷新了 \(data!)")
                
                NetError.ins.succHandleError(response: ponse, data: data!, type: NetType.POST, url: NetAPI.ins.refresh_token, formHeader: nil, formBody: body as NSDictionary, params: nil, callback: { (hand) in
//                    info(res!)
                }, info: info)
            }
            
        }, fail: { (task, error) in
            //刷新token失败,重新登录
            NetError.ins.refreshFailThanLogin(info: info)
//            delog("刷新token失败,重新登录")
//            //转到登录界面 登录
//            let tpvc = AppConfig.shareIns().topViewController()
//            let loginVC = LoginVC()
//            tpvc?.present(loginVC, animated: true, completion: nil)
//            loginVC.loginsuccCB = { (res) in
//                delog("重新登录成功")
//                info(res)
//            }
            
        }, showHUD: true)
        
    }
    
    
}

extension NetHttp {
    
    
}

//MARK:地址
extension NetHttp {
    
    /// 添加收货地址
    func addAddress(params:NSDictionary?, succCb: @escaping (Any)->Void ) -> Void {
        
        NetworkHUD.shareIns().request(.POST, url: NetAPI.ins.addAddress, formHeader: formHeaderAuthorization(), params: params as! [AnyHashable : Any], success: { (res) in
            succCb(res!)
        }, fail: { (task, error) in
            
        }, showHUD: true)
    }
    
    /// 收货地址列表
    func getAddresses(pageNo:Int, pageSize:Int, info: @escaping (Any)->Void) -> Void {
        let params = ["pageNo":pageNo,"pageSize":pageSize]
        NetworkHUD.shareIns().request(.POST, url: NetAPI.ins.getAddresses, formHeader: formHeaderAuthorization(), params:params , success: { (res) in
            
            info(res!)
            
        }, fail: { (task, error) in
            
            NetError.ins.handleError(task: task, error: error as NSError?, type:.POST, url: NetAPI.ins.getAddresses, formHeader: self.formHeaderAuthorization(), formBody: nil, params: params, callback: { (response) in
                info(response)
            })
            
        }, showHUD: true)
    }
    
    /// 设置默认地址 changeDfAddress
    func changeDfAddress(addressId:String, succInfo:@escaping (Any)->() ) -> Void {
        
        let formhead = NSMutableDictionary.init(dictionary: formHeaderAuthorization())
        formhead.setObject("application/json", forKey: "Content-Type" as NSCopying)
        
        NetworkHUD.shareIns().formRequest(.POST, url: NetAPI.ins.changeDfAddress, formHeaders: formhead as! [AnyHashable : Any], formBody: addressId, success: { (res, data) in
            
            //succInfo(res!)
            NetError.ins.succHandleError(response: res, data: data, type: .POST, url: NetAPI.ins.changeDfAddress, formHeader: formhead as? [AnyHashable : Any], formBody: addressId, params: nil, callback: { (hand) in
                succInfo(res!)
            }, info: succInfo)
            //
        }, fail: { (task, error) in
            NetError.ins.handleError(task: task, error: error as NSError?, type: .POST, url: NetAPI.ins.changeDfAddress, formHeader: formhead as? [AnyHashable : Any], formBody: addressId, params: nil, callback: { (response) in
                succInfo(succInfo)
            })
        }, showHUD: true)
    }
    
    
    
    /// 修改收货地址
    func updateAddress(params:NSDictionary, succCb:@escaping (Any)->() ) -> Void {
        
        let formhead = formHeaderAuthorization()
        let url = NetAPI.ins.updateAddress
        
        NetworkHUD.shareIns().request(.POST, url: url, formHeader: formhead, params: params, success: { (res) in
            succCb(res!)
        }, fail: { (task, error) in
            NetError.ins.handleError(task: task, error: error as NSError?, type: .POST, url: url, formHeader: formhead, formBody: nil, params: params, callback: { (response) in
                succCb(response)
            })
        }, showHUD: true)
        
    }
    
    
    /// 删除地址
    func removeAddress(params:NSDictionary, succCb:@escaping (Any)->() ) -> Void {
        
        let formhead = formHeaderAuthorization()
        let url = NetAPI.ins.removeAddress
        
        NetworkHUD.shareIns().request(.POST, url: url, formHeader: formhead, params: params, success: { (res) in
            succCb(res!)
        }, fail: { (task, error) in
            NetError.ins.handleError(task: task, error: error as NSError?, type: .POST, url: url, formHeader: formhead, formBody: nil, params: params, callback: { (response) in
                succCb(response)
            })
        }, showHUD: true)
        
    }
    
}

