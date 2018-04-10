//
//  PublicDefine.swift
//  SmartAgency
//
//  Created by Jerod on 2018/2/12.
//  Copyright © 2018年 Jerod. All rights reserved.
//

//MARK: ********************  屏幕尺寸  ********************

let kScreenW = UIScreen.main.bounds.width  /* 屏幕宽度 */
let kScreenH = UIScreen.main.bounds.height /* 屏幕高度 */
let kSizeScale = kScreenW/375.0 /* 以375屏幕宽度为准的尺寸比例 */

let kStatusH  = UIApplication.shared.statusBarFrame.height /* 20, 44 */
let kNaviH    = CGFloat(kStatusH + 44.0)  /* 64, 88 */
let kHomeIndicatorH = CGFloat((kStatusH==20.0) ? 0.0 : 34.0) /* home_indicator 0, 34 */
let kTabbarH  = CGFloat(49.0 + kHomeIndicatorH) /* 49, 83 */
let kNavi44 = CGFloat(44.0)
let kTab49  = CGFloat(49.0)
let kValidH = (kScreenH - kNaviH - kTabbarH) /** 中间的有效高度(除去navi,tab) */
let kSafeAreaH = (kScreenH - kStatusH - kHomeIndicatorH)

func isiPhoneX() -> Bool {
    if kStatusH > CGFloat(20) {
        return true
    }
    return false
}

//MARK: ********************  font  ********************

let fontDINOT = "DIN OT"
let fontMicrosoftYaHei = "MicrosoftYaHei"
let fontPingFangSCMedium = "PingFangSC-Medium"
/**
 PingFang SC
 - 0 : "PingFangSC-Medium"
 - 1 : "PingFangSC-Semibold"
 - 2 : "PingFangSC-Light"
 - 3 : "PingFangSC-Ultralight"
 - 4 : "PingFangSC-Regular"
 - 5 : "PingFangSC-Thin"
 */

//MARK: ********************  DEBUG  ********************

func delog(_ msg:Any,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    /* Build Setting -> Other Swift Flags - Debug : -D DEBUG */
    #if DEBUG
        let fileName:String = (file as NSString).lastPathComponent
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
        let datestr:String = formatter.string(from: Date())
        print("[DELOG] \(datestr) \(fileName)[\(lineNum)] \(funcName) :",msg/*,"\n"*/)
    #endif
}
 
// NSLog内容太长会显示不全
func dlog(_ msg:Any,file:String = #file,funcName:String = #function,lineNum:Int = #line){
    /* Build Setting -> Other Swift Flags - Debug : -D DEBUG */
    #if DEBUG
        let fileName:String = (file as NSString).lastPathComponent
        NSLog("\(fileName) \(funcName)[\(lineNum)]:\n[DEBUG] %@",[msg])
    #endif
}

//MARK: ********************  app info  ********************

let kBundleID : String = AppConfig.shareIns().getBundleIdentifier()
//let kUserAPw : String = kBundleID + "acountpw"




//MARK:-
import UIKit

class PublicDefine: NSObject {
    /* 单例 */
    static let instance = PublicDefine()
    /* 需要重写自己的init方法,设置为私有,保证单例是真正唯一的,避免外部对象通过访问init方法创建单例类的其他实例 */
    private override init() { }
    
    
}
