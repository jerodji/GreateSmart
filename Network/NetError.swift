//
//  ErrorCodeHandle.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/7.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class NetError: NSObject {
    /** 单例 */
    static let ins = NetError()
    /** 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    
    /// fail通道返回数据的处理
    ///
    /// - Parameters:
    ///   - task: 请求的任务信息
    ///   - error: 请求失败的信息
    ///   - type: 执行请求的参数
    ///   - url: 执行请求的参数
    ///   - formHeader: 执行请求的参数
    ///   - formBody: 执行请求的参数
    ///   - params: 执行请求的参数
    ///   - callback: 执行请求的参数
    func handleError(task:URLSessionDataTask?, error:NSError?, type:NetType, url:String, formHeader:[AnyHashable:Any]?, formBody:Any?, params:Any?, callback:@escaping (Any)->() ) -> Void
    {
        if error == nil { return }
        //if task == nil { return }
        
        if task!.response == nil {
            delog("总有刁民害朕  \(error!.domain) \nURL:\(String(describing: task!.response?.url)) \n任务信息: \(task!)\n错误信息: \(error!)")
            return
        }
        
        let response:HTTPURLResponse = task!.response as! HTTPURLResponse
        delog("总有刁民害朕 \(response.statusCode) \nURL:\(String(describing: response.url)) \n任务信息: \(task!)\n错误信息: \(error!)")
        
        let info:NSDictionary = error!.userInfo as NSDictionary
        let data = info.value(forKey: "com.alamofire.serialization.response.error.data")
        if data != nil {
            let jsonStr = String.init(data: data as! Data, encoding: String.Encoding.utf8)
            let infoDic = JsonTransform.dictionaryFromJSONString(jsonString: jsonStr!)
            delog(infoDic)
        }
        
        statusCodeSwitch(code: response.statusCode, type: type, url: url, formHeader: formHeader, formBody: formBody, params: params, callback: callback)
    }
    
   /**
    错误码的处理
    */
    func statusCodeSwitch(code:Int, type:NetType,url:String,formHeader:[AnyHashable:Any]? ,formBody:Any? ,params:Any? ,callback:@escaping (Any)->()) -> Void
    {
        switch code {
            
        case 400:do {
            delog("400 状态测试")
        };break
            
        //token失效
        case 401:do {
            delog("token失效")
            NetHttp.ins.refreshToken(info: { (res) in
                
                let newFormHeader = NetHttp.ins.formHeaderAuthorization()
                delog("重新请求接口 \(url)")
                NetworkHUD.shareIns().request(type, url: url, formHeader: newFormHeader, params: params, success: { (res) in
                    callback(res!)
                }, fail: { (task, error) in
                    delog("网络繁忙!")
                }, showHUD: true)
            })
        };break
            
        case 402:do {
            delog("402 状态测试")
        };break
            
        case 500:do {
            delog("500 状态测试")
        };break
            
        default: break
        }
    }
    
    
    /// succ通道返回数据的错误处理
    ///
    /// - Parameters:
    ///   - response: 请求返回的结果
    ///   - data: 请求返回的数据
    ///   - type: 执行请求的参数
    ///   - url: 执行请求的参数
    ///   - formHeader: 执行请求的参数
    ///   - formBody: 执行请求的参数
    ///   - params: 执行请求的参数
    ///   - callback: 执行请求的参数
    ///   - info: 执行请求的参数
    func succHandleError(response:HTTPURLResponse?,data:Any?, type:NetType, url:String, formHeader:[AnyHashable:Any]?, formBody:Any?, params:[AnyHashable:Any]?, callback:@escaping (Any)->(), info: @escaping (Any)->() ) -> Void
    {
        let status = response?.statusCode
        if status == 200 {
            callback(response as Any)
            return
        }
        
        delog("总有刁民害朕~~  \(String(describing: response?.statusCode))  \nURL : \(String(describing: response?.url)) \n错误信息 : \(String(describing: data))")
        
        if data == nil {return}
        
        refreshStatusCodeSwitch(code: status!, type: type, url: url, formHeader: formHeader, formBody: formBody, params: params, cb: callback, info: info)
    }
    
    //刷新token返回状态码处理
    func refreshStatusCodeSwitch(code:Int, type:NetType,url:String,formHeader:[AnyHashable:Any]? ,formBody:Any? ,params:[AnyHashable:Any]? ,cb:@escaping (Any)->(), info: @escaping (Any)->()) -> Void
    {
        if code == 200 {return}
        
        refreshFailThanLogin(info: info)
    }
 
    func refreshFailThanLogin(info: @escaping (Any)->()) -> Void {
        delog("刷新token失败,重新登录")
        //转到登录界面 登录
        let tpvc = AppConfig.shareIns().topViewController()
        let loginVC = LoginVC()
        tpvc?.present(loginVC, animated: true, completion: nil)
        loginVC.loginsuccCB = { (res) in
            delog("重新登录成功")
            info(res)
        }
    }
    
}
