//
//  BaseModel.swift
//  GreateSmart
//
//  Created by hailin on 2018/2/24.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

class BaseModel: NSObject,NSCoding {
    
    override init() {
        super.init()
    }
    
//    override static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
//        return ["userId":"id"]
//    }
    
    // Swift runtime 其实是 OC 实现
    /**
     * 解档
     */
    required init?(coder aDecoder: NSCoder) {
        super.init()
       
        let ivarCount = UnsafeMutablePointer<UInt32>.allocate(capacity: 0)
        let ivars = class_copyIvarList(object_getClass(self), ivarCount)
        
        for i in 0...Int(ivarCount[0])-1 {
            let ivar = ivars![i]
            let ivarName = String.init(utf8String: ivar_getName(ivar)!)
            let ivarValue = aDecoder.decodeObject(forKey: ivarName!)
            self.setValue(ivarValue, forKey: ivarName!)
        }
        
        free(ivars)
    }
    
    /**
     * 归档
     */
    func encode(with aCoder: NSCoder) {
        
        let ivarCount = UnsafeMutablePointer<UInt32>.allocate(capacity: 0)
        let ivars = class_copyIvarList(object_getClass(self), ivarCount)
        
        for i in 0...Int(ivarCount[0])-1 {
            let ivar = ivars![i]
            let ivarName = String.init(utf8String: ivar_getName(ivar)!)
            let ivarValue = self.value(forKey: ivarName!) // KVC
            aCoder.encode(ivarValue, forKey: ivarName!)
        }
        
        free(ivars)
    }
    
}

