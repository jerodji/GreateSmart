//
//  JsonTransform.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/7.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class JsonTransform: NSObject {
    
    // JSONString转换为字典
    static func dictionaryFromJSONString(jsonString:String) -> NSDictionary {
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
    }
    
    //字典转换为JSONString
    static func JSONStringFromDictionary(dictionary:NSDictionary) -> String {
        
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            NSLog("无法解析出JSONString")
            return ""
        }
        
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }

}
