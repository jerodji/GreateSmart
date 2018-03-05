//
//  StringSize.swift
//  GreateSmart
//
//  Created by hailin on 2018/3/1.
//  Copyright © 2018年 Jerod. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func getStringSize(fontSize:CGFloat) -> CGSize {
        // 计算字符串的宽度，高度
        let string:String = self
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedStringKey.font:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = string.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: option, attributes: attributes, context: nil)
        return rect.size
    }
    
}
