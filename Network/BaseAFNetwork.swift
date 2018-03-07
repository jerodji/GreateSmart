//
//  BaseAFNetwork.swift
//  GreateSmart
//
//  Created by Jerod on 2018/2/23.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit
//import AFNetworking

enum RequestType:String {
    case POST = "POST"
    case GET  = "GET"
}

class BaseAFNetwork: NSObject {
    /* 单例 */
    static let instance = BaseAFNetwork()
    /* 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    typealias SUCC = (_ response:Any) -> ()
    typealias FAIL = (_ error:NSError) -> ()
    //var succblock : SUCC?
    
    func POST(api:String, params:NSDictionary?, succCB : @escaping SUCC) -> Void {
        request(type: RequestType.POST, urlHead: URLHEAD, api: api, params: params) { (res) in
            succCB(res)
        }
    }
    
    func GET(api:String, params:NSDictionary?, succCB : @escaping SUCC) -> Void {
        request(type: RequestType.GET, urlHead: URLHEAD, api: api, params: params) { (res) in
            succCB(res)
        }
    }
    
    //MARK: request
    
    //@escaping 标记为 逃逸闭包
    func request(type:RequestType, urlHead:String, api:String, params:NSDictionary?, succCB : @escaping SUCC) {
        
        if type == RequestType.POST {
            
            AFBaseNetwork.sharedInstance().post(urlHead, api: api, params:params as? [AnyHashable : Any], success: { (response) in
                
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
        
        if type == RequestType.GET {
            
            AFBaseNetwork.sharedInstance().get(urlHead, api: api, params: params as? [AnyHashable : Any], success: { (response) in
                
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
    
    //MARK: fullURL
    
    func request(type:RequestType, fullURL:String, params:NSDictionary?, succCB : @escaping SUCC){
        
        if type == RequestType.POST {
            AFBaseNetwork.sharedInstance().request(NetType.POST, fullURL: fullURL, parameterDict: params as! [AnyHashable : Any], success: { (res) in
                
                succCB(res!)
                
            }, fail: { (task,error) in
                
                if error != nil {
                    ErrorCodeHandle.handleInfo(task: task!, error: error! as NSError)
                } else {
                    delog("error info is nil")
                }
                
            })
        }
        
    }
    
    //MARK: upload
    
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
