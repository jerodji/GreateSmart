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
    
    func handleError(task:URLSessionDataTask?, error:NSError?,
                     type:NetType,
                     url:String,
                     formHeader:[AnyHashable:Any]? ,
                     formBody:NSDictionary? ,
                     params:[AnyHashable:Any]? ,
                     callback:@escaping (Any)->()
        ) -> Void {
        
        if error == nil { return }
        if task == nil { return }
        
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
        
        switch response.statusCode {
            
        case 400:do {
            delog("400 lafl;aksfljasklfjadsklfj")
        };break
            
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
            
        };break
            
        case 500:do {

        };break

        default: break

        }

    }

    
    
    
}
