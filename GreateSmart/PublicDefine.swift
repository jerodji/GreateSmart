//
//  PublicDefine.swift
//  SmartAgency
//
//  Created by Jerod on 2018/2/12.
//  Copyright © 2018年 Jerod. All rights reserved.
//

/**======================  屏幕尺寸  ======================**/

let kScreenW = UIScreen.main.bounds.width  /* 屏幕宽度 */
let kScreenH = UIScreen.main.bounds.height /* 屏幕高度 */
let kSizeScale = kScreenW/375.0 /* 以375屏幕宽度为准的尺寸比例 */

let kStatusH  = UIApplication.shared.statusBarFrame.height /* 20, 44 */
let kNaviH    = CGFloat(kStatusH + 44.0)  /* 64, 88 */
let kHomeIndicatorH = CGFloat((kStatusH==20.0) ? 0.0 : 34.0) /* home_indicator 0, 34 */
let kTabbarH  = CGFloat(49.0 + kHomeIndicatorH) /* 49, 83 */
let kNavi44 = CGFloat(44.0)
let kTab49  = CGFloat(49.0)
let kSafeH = (kScreenH - kNaviH - kTabbarH)

func isiPhoneX() -> Bool {
    if kStatusH > CGFloat(20) {
        return true
    }
    return false
}

/**======================  DEBUG  =======================**/

func delog(_ msg:Any,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    /* Build Setting -> Other Swift Flags - Debug : -D DEBUG */
    #if DEBUG
        let fileName:String = (file as NSString).lastPathComponent
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
        let datestr:String = formatter.string(from: Date())
        print("\(datestr) \(fileName) \(funcName)[\(lineNum)]" + ":\n[DEBUG] ",msg,"\n")
    #endif
}




/**======================    =======================**/



import UIKit

class PublicDefine: NSObject {
    /* 单例 */
    static let instance = PublicDefine()
    /* 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    
}
