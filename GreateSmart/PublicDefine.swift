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
        print("\(datestr) \(fileName) \(funcName)[\(lineNum)]" + ":\n[SmartLog] ",msg,"\n")
    #endif
}

/**======================  Color  =======================**/
let kColorTabbar = UIColor.white
let kColorNavi   = UIColor.white
let kColorTheme  = UIColor.black /* 主题颜色 */


/**======================    =======================**/



import UIKit

class PublicDefine: NSObject {
    
}
