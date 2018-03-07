//
//  ErrorCodeHandle.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/7.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class ErrorCodeHandle: NSObject {
    
    static func handleInfo(task:URLSessionDataTask, error:NSError) -> Void {
        
        let response:HTTPURLResponse = task.response as! HTTPURLResponse
        
        delog("总有刁民害朕 \(response.statusCode) \n\(String(describing: response.url)) \n任务信息: \(task)\n错误信息: \(error)")
        
        let info:NSDictionary = error.userInfo as NSDictionary
        let data = info.value(forKey: "com.alamofire.serialization.response.error.data")
        if data != nil {
            let jsonStr = String.init(data: data as! Data, encoding: String.Encoding.utf8)
            let infoDic = JsonTransform.dictionaryFromJSONString(jsonString: jsonStr!)
            delog(infoDic)
        }
        
        
        
        
        
        
        
        
    }
    
}
