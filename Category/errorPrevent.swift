//
//  errorPrevent.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/13.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

extension NSArray {
    
    /**
     *  runtime Method Swizzling 可以实现方法交换,但是在swift中就不能在编译时利用那些可用的安全检查了
     */
//    open func object(at index: Int) -> Any {
//
//    }
    
    open func safe_object(at index: Int) -> Any {
        
        if index < 0 {
            NSLog("傻*! 你特么数组是负数??")
            return ""
        }
        
        if index <= (self.count-1) {
            return self.object(at:index)
        } else {
            NSLog("数组越界,取最后一个返回, index:\(index), \(self)")
            return self.object(at:(self.count-1))
        }
        
    }
    
    
    
    
    
    
    
}
