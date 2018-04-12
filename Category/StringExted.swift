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


/**
 1.截取前面三个字符串,要求输出结果为abc
 
 let str ="abcdefghi"
 
 let index = str.index(str.startIndex, offsetBy:3)//获取字符d的索引
 
 let result = str.substring(to: index)//从起始截取到索引的所有字符串,即abc,注意不包含d
 
 打印结果为 abc
 
 
 
 2.截取第四个开始的所有字符串,要求输出结果为defghi
 
 let str = "abcdefghi"
 
 let index = str.index(str.startIndex, offsetBy: 3)//获取字符d的索引
 
 let result = str.substring(from: index)//从d的索引开始截取后面所有的字符串即defghi
 
 打印结果为defghi
 
 
 
 3.截取第4个开始的长度为2个字符串,要求结果输出为de
 
 
 let str ="abcdefghi"
 
 
 let startIndex = str.index(str.startIndex, offsetBy:3)//获取d的索引
 
 let endIndex = str.index(startIndex, offsetBy:2)//从d的索引开始往后两个,即获取f的索引
 
 let result = str.substring(with: startIndex..<endIndex)//输出d的索引到f索引的范围,注意..<符号表示输出不包含f
 
 打印结果为de
 
 
 
 4.判断字符串是否包含某段字符
 
 let str = "abcdefghi"
 
 let result = str.contains("ac")
 
 打印结果为false
 
 let result = str.contains("abc")
 
 打印结果为true
 
 
 5.字符串大小写转换
 
 let str = "ABCDEFGHI"
 
 
 let result = str.lowercased()
 
 输出结果为abcdefghi
 
 
 
 let str = "abcdefghi"
 
 let result = str.uppercased()
 
 输出结果为ABCDEFGHI
 
 
 6.指定字符串替换为其他字符串,将abc替换成m,使输出结果为mdefghi
 
 let str = "abcdefghi"
 
 let result = str.replacingOccurrences(of:"abc", with: "m")
 
 输出结果为mdefghi
 
 
 
 7.指定范围内的字符串替换为其他字符串,将cde替换成m,使输出结果为abmfghi
 
 let str = "abcdefghi"
 
 let startIndex = str.index(str.startIndex, offsetBy:2)
 
 let endIndex = str.index(startIndex, offsetBy:3)
 
 let result = str.replacingCharacters(in: startIndex..<endIndex, with:"m")
 
 输出结果为abmfghi
 
 
 
 8.有时候不确定字符串的长度,需求为截取字符串末尾面开始往前5位,截取长度为2的字符串,使输出为ef
 
 let str = "abcdefghi"
 
 let startIndex = str.index(str.startIndex, offsetBy: str.lengthOfBytes(using: .utf8) - 5)
 
 let endIndex = str.index(startIndex, offsetBy:2)
 
 let result = str.substring(with: startIndex..<endIndex)
 
 输出结果为ef
 
 
 9. 字符串转为数组,使得输出为["a", "b", "c", "d", "e", "f", "g", "h", "i"]
 
 let str = "a.b.c.d.e.f.g.h.i"
 
 let result = str.components(separatedBy:".")
 
 输出为["a", "b", "c", "d", "e", "f", "g", "h", "i"]
 */
