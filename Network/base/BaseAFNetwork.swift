//
//  BaseAFNetwork.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit
//import AFNetworking

//enum RequestType:String {
//    case POST = "POST"
//    case GET  = "GET"
//}

class BaseAFNetwork: NSObject {
    /* 单例 */
    static let instance = BaseAFNetwork()
    /* 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    typealias SUCC = (_ response:Any) -> ()
    typealias FAIL = (_ error:NSError) -> ()
    //var succblock : SUCC?
    
    //MARK:- ----------------------- 表单请求接口  -----------------------
    /// 设置表单的请求封装
    ///
    /// - Parameters:
    ///   - type: POST/GET
    ///   - formHeaders: 表单请求头 header
    ///   - body: 表单请求体 body
    ///   - url: url
    ///   - params: 参数- 字典/实体类
    ///   - isEntity: params参数是否为实体类
    ///   - succCB: 成功回调
    ///   - failCB: 失败回调
    func request(type:NetType, formHeaders:NSDictionary, body:NSDictionary, url:String, params:Any, isEntity:Bool, succCB:@escaping SUCC, failCB:@escaping FAIL) -> Void {
        
        AFBaseNetwork.sharedInstance().request(
            type,
            formHeaders: formHeaders as! [AnyHashable : Any],
            body: body as! [AnyHashable : Any],
            url: url,
            params: params,
            isEntity: isEntity,
            success: succCB,
            fail: { (task,error) in
                if error != nil {
                    ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
                } else {
                    delog("error info is nil")
                }
        })
        
    }
    
    //MARK:- ----------------------- entity -----------------------
    
    func POST(api:String, paramsEntity:Any?, succCB : @escaping SUCC) -> Void {
        
        AFBaseNetwork.sharedInstance().post(URLHEAD, urlFunc: api, paramsEntity: paramsEntity, success: { (res) in
            
            succCB(res!)
            
        }, fail: { (task, error) in
            
            if error != nil {
                ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
            } else {
                delog("error info is nil")
            }
        })
    }
    
    func GET(api:String, paramsEntity:Any?, succCB : @escaping SUCC) -> Void {
        
        AFBaseNetwork.sharedInstance().get(URLHEAD, urlFunc: api, paramsEntity: paramsEntity, success: { (res) in
            
            succCB(res!)
            
        }, fail: { (task, error) in
            
            if error != nil {
                ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
            } else {
                delog("error info is nil")
            }
        })
    }
    
    func request(type:NetType, urlHead:String, api:String, paramsEntity:Any?, succCB : @escaping SUCC) {
        
        AFBaseNetwork.sharedInstance().request(type, urlHead: urlHead, urlFunc: api, paramsEntity: paramsEntity, success: succCB, fail: { (task, error) in
            if error != nil {
                ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
            } else {
                delog("error info is nil")
            }
        })

    }
    
    func request(type:NetType, fullURL:String, paramsEntity:Any?, succCB : @escaping SUCC) -> Void {
        
        AFBaseNetwork.sharedInstance().request(type, url: fullURL, paramsEntity: paramsEntity, success: succCB, fail: { (task, error) in
            if error != nil {
                ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
            } else {
                delog("error info is nil")
            }
        })
        
    }
    
    //MARK:- ----------------------- dict -----------------------
    /**
     *  post
     */
    func POST(api:String, params:NSDictionary?, succCB : @escaping SUCC) -> Void {
        request(type: NetType.POST, urlHead: URLHEAD, api: api, params: params) { (res) in
            succCB(res)
        }
    }
    
    /**
     *  get
     */
    func GET(api:String, params:NSDictionary?, succCB : @escaping SUCC) -> Void {
        request(type: NetType.GET, urlHead: URLHEAD, api: api, params: params) { (res) in
            succCB(res)
        }
    }
    
    /**
     * request
     */
    //@escaping 标记为 逃逸闭包
    func request(type:NetType, urlHead:String, api:String, params:NSDictionary?, succCB : @escaping SUCC) {
        
        if type == NetType.POST
        {
            AFBaseNetwork.sharedInstance().post(urlHead, api: api, paramsDict:params as? [AnyHashable : Any], success: { (response) in
                
                if NotNull(response) {
                    succCB(response!)
                }
                
            }, fail: { (task,error) in
                
                if error != nil {
                    ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
                } else {
                    delog("error info is nil")
                }
            })
        }
        
        if type == NetType.GET
        {
            AFBaseNetwork.sharedInstance().get(urlHead, api: api, paramsDict: params as? [AnyHashable : Any], success: { (response) in
                
                if NotNull(response) {
                    succCB(response!)
                }
                
            }, fail: { (task,error) in
                
                if error != nil {
                    ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
                } else {
                    delog("error info is nil")
                }
            })
        }
    }
    
    
    /**
     *  fullURL
     */
    func request(type:NetType, fullURL:String, params:NSDictionary?, succCB : @escaping SUCC){
        
        AFBaseNetwork.sharedInstance().request(type, fullURL: fullURL, parameterDict: params as! [AnyHashable : Any], success: { (res) in
            
            succCB(res!)
            
        }, fail: { (task,error) in
            
            if error != nil {
                ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
            } else {
                delog("error info is nil")
            }
        })
        
    }
    
    
    //MARK:- ----------------------- upload -----------------------
    /// 上传
    ///
    /// - Parameters:
    ///   - api: api
    ///   - params: 参数 - dict
    ///   - data: 上传的data
    ///   - name: name
    ///   - fileName: 文件名
    ///   - mimeType: 文件格式
    ///   - succCB: 成功回调
    ///   - progressCB: 进度回调
    func upload(api:String, params:NSDictionary, data:NSData, name:String, fileName:String, mimeType:String, succCB: @escaping SUCC, progressCB: @escaping (_ prog: CGFloat) -> ()) {
        
        AFBaseNetwork.sharedInstance().uploadData(withURLHead: URLHEAD, urlFunc: api, parameters: params as? [AnyHashable : Any], data: data as Data!, name: name, fileName: fileName, mimeType: mimeType, success: { (res) in
            
            succCB(res!)
            
        }, failure: { (task,error) in
            
            if error != nil {
                ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
            } else {
                delog("error info is nil")
            }
            
        }, progress: { (p) in
            
            progressCB(p)
            
        })
    }
    
    
}
