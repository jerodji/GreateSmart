//
//  AppConfig.h
//  UnicornTV
//
//  Created by JerodJi on 2017/6/16.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define MainScrenH  [UIScreen mainScreen].bounds.size.height

@interface AppConfig : NSObject

+ (AppConfig*)shareIns;


- (NSString*)getProductName;
- (NSString*)getProductDisplayName;
/** 包名 */
- (NSString*)getBundleIdentifier;
/** Version 版本号 1.3.1 发布显示的 */
- (NSString*)getShortVersion;
/** // Build 版本号 */
- (NSString*)getBuildVersion;
/** //获取当前系统的语言环境 */
- (NSString*)getPreferredLanguage;
- (BOOL)isOrientationsPortrait;


//


//- (NSString*)DoPhoneInfo;
- (NSString*)getCurrentTime; //获取当前时间
- (NSString*)getNetworkType; //获取网络类型
- (NSString*)getCpuType;     //cpu
- (NSString*)getDeviceModel; //获取设备型号
- (NSString*)getIPAddress;   //ip
- (NSString*)getMacAddress;  //获取物理地址
//- (NSString*)getAndroidID;
- (long long)getTotalMemorySize; //获取设备内存


//- (NSString*)getIOSID;         //uuid
- (NSString*)createIOSID;      //为系统创建一个随机的标示符
- (NSString*)getChannelID;     //100
- (NSString*)getDeviceName;    //设备名称
- (NSString*)getUserPhoneName; //手机别名： 用户定义的名称
- (NSString*)getSystemVersion;


//+ (UIViewController*)appRootController;
//+ (void)showMessage:(NSString*)stringTip;


- (NSString*)getAdVSID;


//可以获取到view的父容器的控制器的方法
//+ (UIViewController *)getSuperViewController:(UIView *)view;

/** 获取当前显示在屏幕最顶层的ViewController */
- (UIViewController *)topViewController;

@end
