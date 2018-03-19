//
//  UIColor_extension.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/19.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    
    class func RGBA(_ r:CGFloat, _ g:CGFloat, _ b:CGFloat, _ a:CGFloat) -> UIColor {
        return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    class func RGB(_ r:CGFloat, _ g:CGFloat, _ b:CGFloat) -> UIColor {
        return RGBA(r, g, b, 1)
    }
    
}
