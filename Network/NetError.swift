//
//  ErrorCodeHandle.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/7.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class NetError: NSObject {
    
    static let ins = NetError() /** 单例 */
    private override init() { } /** 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    
    /**
     fail通道返回数据的处理
     */
    func handleError(task:URLSessionDataTask?, error:NSError?, type:NetType, url:String, formHeader:[AnyHashable:Any]?, formBody:NSDictionary?, params:Any?, callback:@escaping (Any)->() ) -> Void
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
        
        statusCodeSwitch(code: response.statusCode, type: type, url: url, formHeader: formHeader, formBody: formBody, params: params, cb: callback)
    }
    
   /**
    错误码的处理
    */
    func statusCodeSwitch(code:Int, type:NetType,url:String,formHeader:[AnyHashable:Any]? ,formBody:NSDictionary? ,params:Any? ,cb:@escaping (Any)->()) -> Void
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
                    cb(res!)
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

    /**
     succ通道返回数据的错误处理
     {
         error = "Unauthorized";
         message = "Full authentication is required to access this resource";
         path = "/oauth/token";
         status = 401;
         timestamp = 1523156483560;
     }
     */
    func succHandleError(response:HTTPURLResponse?,data:Any?, type:NetType, url:String, formHeader:[AnyHashable:Any]?, formBody:NSDictionary?, params:[AnyHashable:Any]?, callback:@escaping (Any)->(), info: @escaping (Any)->() ) -> Void
    {
        delog("总有刁民害朕~~  \(response?.statusCode)  \nURL : \(String(describing: response?.url)) \n错误信息 : \(String(describing: data))")
        
        if data == nil {return}
        
        let status = response?.statusCode
        if status == 200 {return}
        refreshStatusCodeSwitch(code: status!, type: type, url: url, formHeader: formHeader, formBody: formBody, params: params, cb: callback, info: info)
        
//        if data is NSDictionary {
//
//            let resDict = data as! NSDictionary
//            if resDict["error"] == nil {return}
//
//            /**
//             {
//             error = "invalid_grant";
//             "error_description" = "Invalid refresh token: ";
//             }
//             */
////            let error = resDict["error"] as! String
////            let message = resDict["message"] as! String
////            let path = resDict["path"] as! String
////            let timestamp = resDict["timestamp"] as! Int64
////            let status = resDict["status"] as! Int
//
//        }
        
        
        
    }
    
    //刷新token返回状态码处理
    func refreshStatusCodeSwitch(code:Int, type:NetType,url:String,formHeader:[AnyHashable:Any]? ,formBody:NSDictionary? ,params:[AnyHashable:Any]? ,cb:@escaping (Any)->(), info: @escaping (Any)->()) -> Void
    {
        if code == 200 {return}
        
        refreshFailThanLogin(info: info)
        
//        switch code {
//
//        case 400:do {
//            delog("400 状态测试")
//        };break
//
//        //token失效
//        case 401:do {
//
//        };break
//
//        case 402:do {
//            delog("402 状态测试")
//        };break
//
//        case 500:do {
//            delog("500 状态测试")
//        };break
//
//        default: break
//        }
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
