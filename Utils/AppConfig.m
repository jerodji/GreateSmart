//
//  AppConfig.m
//  UnicornTV
//
//  Created by JerodJi on 2017/6/16.
//  Copyright © 2017年 Droi. All rights reserved.
//

#import "AppConfig.h"
//#import "ZHNetworkingManager.h"
//#import "ZHNavigationController.h"

#import <mach/mach.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#import <objc/runtime.h>

#include <sys/utsname.h>

//#import "GDEKeychainItemWrapper.h"


@implementation AppConfig

/*
- (NSURLSessionDataTask *)POST:(NSString *)URLString
parameters:(id)parameters
success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
*/

static AppConfig* _instance = nil;
+ (AppConfig*)shareIns
{
    if (nil==_instance) {
        _instance = [[AppConfig alloc] init];
    }
    return _instance;
}

- (NSString*)getBundleIdentifier
{
    return  [[NSBundle mainBundle] bundleIdentifier];
}

-(NSString*)getProductName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //    CFShow(infoDictionary);
    // app名称
    NSString *value = [infoDictionary objectForKey:@"CFBundleName"];
    // app build版本
    
    return value;
}

-(NSString*)getProductDisplayName
{
    //    NSString *executableFile = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];    //获取项目名称
    //
    //    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];      //获取项目版本号
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //    CFShow(infoDictionary);
    // app名称
    NSString * app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    return app_Name;
}

// Version 版本号 1.3.1 发布显示的
-(NSString*)getShortVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //    CFShow(infoDictionary);
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return app_Version;
}

// Build 版本号
-(NSString*)getBuildVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //    CFShow(infoDictionary);
    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return app_build;
}



- (BOOL)isOrientationsPortrait
{
    //判断系统的版本是6.0以上的。
//        if ([[UIDevice currentDevice]systemVersion].floatValue >= 6.0)
    {
        //判断设备当前的方向，然后重新布局不同方向的操作。
        UIInterfaceOrientation currentOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        if (currentOrientation == UIInterfaceOrientationPortrait || currentOrientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            return YES;
        }
        else if (currentOrientation == UIInterfaceOrientationLandscapeLeft || currentOrientation == UIInterfaceOrientationLandscapeRight)
        {
            return NO;
        }
        else
        {
            return NO;
        }
    }
}

-(NSString*)getPreferredLanguage
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    NSArray* all_languages = [defaults objectForKey:@"AppleLanguages"];
    NSString* preferred_language = [all_languages objectAtIndex:0];
//    NSLog(@"当前系统语言：%@",preferred_language);
    return preferred_language;
}


//=============================

//获取当前时间
-(NSString*)getCurrentTime
{
    NSDate *dateNow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:dateNow];
    NSDate *localDate = [dateNow dateByAddingTimeInterval:interval];
    NSString * str = [NSString stringWithFormat:@"%@",localDate];
    return str;
}

//获取网络类型
-(NSString*)getNetworkType
{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress); //创建测试连接的引用：
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    NSString* Type = @"无";
    if ((flags & kSCNetworkReachabilityFlagsReachable) == 0)
    {
        return Type;
    }
    
    
    if ((flags & kSCNetworkReachabilityFlagsConnectionRequired) == 0)
    {
        Type = @"Wi-Fi";
    }
    if ((((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) ||
         (flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0))
    {
        if ((flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0)
        {
            Type = @"Wi-Fi";
        }
    }
    if ((flags & kSCNetworkReachabilityFlagsIsWWAN) == kSCNetworkReachabilityFlagsIsWWAN)
    {
        if((flags & kSCNetworkReachabilityFlagsReachable) == kSCNetworkReachabilityFlagsReachable) {
            if ((flags & kSCNetworkReachabilityFlagsTransientConnection) == kSCNetworkReachabilityFlagsTransientConnection) {
                Type = @"3G";
                if((flags & kSCNetworkReachabilityFlagsConnectionRequired) == kSCNetworkReachabilityFlagsConnectionRequired) {
                    Type = @"2G";
                }
            }
        }
    }
    return Type;
}


//获取IP地址
-(NSString*)getIPAddress
{
    NSString *address = @"error";
    
    struct ifaddrs *interfaces = NULL;
    
    struct ifaddrs *temp_addr = NULL;
    
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) {
        
        // Loop through linked list of interfaces
        
        temp_addr = interfaces;
        
        while(temp_addr != NULL) {
            
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                
                // Check if interface is en0 which is the wifi connection on the iPhone
                
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    
                    // Get NSString from C String
                    
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
        }
        
    }
    
    freeifaddrs(interfaces);
    return address;
}


//获取物理地址
-(NSString*)getMacAddress
{
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
//    NSLog(@"outString:%@", outstring);
    free(buf);
    return [outstring uppercaseString];
}

-(NSString*)getCpuType
{
    host_basic_info_data_t hostInfo;
//        mach_msg_type_number_t infoCount = HOST_BASIC_INFO_COUNT;
//        kern_return_t ret = host_info(mach_host_self(), HOST_BASIC_INFO, (host_info_t)&hostInfo, &infoCount);
//    
//        if (ret == KERN_SUCCESS) {
//            NSLog(@"the cpu_subtype is %d",hostInfo.cpu_type);
//        }
    NSString *cputypeString = @"";
    switch (hostInfo.cpu_type)
    {
        case -1:{cputypeString = @"ANY";} break;
        case 1: {cputypeString = @"VAX";} break;
        case 6: {cputypeString = @"MC690x0";} break;
        case 7: {cputypeString = @"X86";} break;
        case 10:{cputypeString = @"MC98000";} break;
        case 11:{cputypeString = @"HPPA";} break;
        case 12:{cputypeString = @"ARM";} break;
        case 13:{cputypeString = @"MC88000";} break;
        case 14:{cputypeString = @"SPARC";} break;
        case 15:{cputypeString = @"I860";} break;
        case 18:{cputypeString = @"POWERPC";} break;
        case CPU_TYPE_X86 | CPU_ARCH_ABI64:{cputypeString = @"X86_64";} break;
        case CPU_TYPE_ARM | CPU_ARCH_ABI64:{cputypeString = @"ARM64";} break;
        case CPU_TYPE_POWERPC | CPU_ARCH_ABI64:{cputypeString = @"POWERPC64";} break;
        default:
            break;
    }
    return cputypeString;
}

//获取设备型号
-(NSString *)getDeviceModel

{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G"; // (A1203)
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G"; // (A1241/A1324)
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS"; // (A1303/A1325)
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4"; // (A1332)
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4"; // (A1332)
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4"; // (A1349)
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S"; // (A1387/A1431)
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5"; // (A1428)
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5"; // (A1429/A1442)
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5C"; // (A1456/A1532)
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5C"; // (A1507/A1516/A1526/A1529)
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5S"; // (A1453/A1533)
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5S"; // (A1457/A1518/A1528/A1530)
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus"; // (A1522/A1524)
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6"; // (A1549/A1586)
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6S";
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6S Plus";
    if ([platform isEqualToString:@"iPhone8,3"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    //iPod Touch
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G"; // (A1213)
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G"; // (A1288)
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G"; // (A1318)
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G"; // (A1367)
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G"; // (A1421/A1509)
    if ([platform isEqualToString:@"iPod7,1"])   return @"iPod Touch 6G"; //
    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G"; // (A1219/A1337)
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2"; // (A1395)
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2"; // (A1396)
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2"; // (A1397)
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2"; // (A1395+New Chip)
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G"; // (A1432)
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G"; // (A1454)
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G"; // (A1455)
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3"; // (A1416)
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3"; // (A1403)
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3"; // (A1430)
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4"; // (A1458)
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4"; // (A1459)
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4"; // (A1460)
    
     //iPad Air
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air"; // (A1474)
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air"; // (A1475)
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air"; // (A1476)
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G"; // (A1489)
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G"; // (A1490)
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G"; // (A1491)
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPad Mini 3G"; // (A1599)
    if ([platform isEqualToString:@"iPad5,3"])   return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])   return @"iPad Air 2";
    
    //iPad mini
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPadmini1G";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPadmini2";
    if ([platform isEqualToString:@"iPad4,7"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad4,8"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad4,9"])   return @"iPadmini3";
    if ([platform isEqualToString:@"iPad5,1"])   return @"iPadmini4";
    if ([platform isEqualToString:@"iPad5,2"])   return @"iPadmini4";
    
    //simulator
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
}

//获取设备内存
-(long long)getTotalMemorySize
{
    return [NSProcessInfo processInfo].physicalMemory/1024.0/1024.0;
}


//- (NSString*)getIOSID
//{
////    NSString *identifierStr = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
////    NSLog(@"设备唯一标识符:%@",identifierStr);
//
//    NSString* string = nil;
//
//    GDEKeychainItemWrapper* item = [[GDEKeychainItemWrapper alloc] initWithIdentifier:@"UCIOSID" accessGroup:nil];
//
//    NSString * UCiOSId = [item objectForKey:(id)(kSecAttrService)];//读取
//
//    if (UCiOSId.length == 0 || UCiOSId == nil) //keychain中 不存在 UCIOSID
//    {
//        NSString *newId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//
//        [item setObject:newId forKey:(id)(kSecAttrService)]; //标识一个Item,//保存
//
//        string = newId;
//    }
//    else //keychain中 存在 UCIOSID
//    {
//        string = UCiOSId; //[item objectForKey:(id)(kSecAttrService)];
//    }
//
//    NSLog(@"device id ==== %@",string);
//
//    return string;
//}

////为系统创建一个随机的标示符
- (NSString*)createIOSID
{
    NSString *iosid = [[NSUserDefaults standardUserDefaults] objectForKey:@"UUID"];//获取标识为"UUID"的值
    if(iosid == nil)
    {
        if([[[UIDevice currentDevice] systemVersion] floatValue] > 6.0)
        {
            NSString *identifierNumber = [[NSUUID UUID] UUIDString];//ios 6.0 之后可以使用的api
            [[NSUserDefaults standardUserDefaults] setObject:identifierNumber forKey:@"UUID"];  //保存为UUID
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        else
        {
            CFUUIDRef uuid = CFUUIDCreate(NULL);
            CFStringRef uuidString = CFUUIDCreateString(NULL, uuid);//ios6.0之前使用的api
            NSString *identifierNumber = [NSString stringWithFormat:@"%@", uuidString];
            [[NSUserDefaults standardUserDefaults] setObject:identifierNumber forKey:@"UUID"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            CFRelease(uuidString);
            CFRelease(uuid);
        }
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"UUID"];
    }
    return iosid;
}

- (NSString*)getChannelID
{
    NSString * chanelID = @"zunizgdy"; //appstore
    
#ifdef CHANNEL_ID
    
    
    
#endif
    
    return chanelID;
}

//设备名称
- (NSString*)getDeviceName
{
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    NSLog(@"设备名称: %@",deviceName );
    return deviceName;
}

//手机别名： 用户定义的名称
- (NSString*)getUserPhoneName
{
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    NSLog(@"手机别名: %@", userPhoneName);
    return userPhoneName;
}

- (NSString*)getSystemVersion
{
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"手机系统版本: %@", phoneVersion);
    return phoneVersion;
}

//- (NSString*)getDeviceModel
//{
//    NSString * phoneModel =  [self getCurrentDeviceModel];
//    NSLog(@"手机型号:%@",phoneModel);
//    return phoneModel;
//}




- (NSString*)getAdVSID
{
    return @"";
}

-(UIViewController*)appRootController
{
//    NSLog(@"define begin");
    //    UNITY_VERSION
    
//#if defined(UNITY_VERSION)
//    UnityAppController* unityDelegate = (UnityAppController*)([UIApplication sharedApplication].delegate);
//    NSLog(@"UNITY_VERSION return UnityDelegate.rootViewController");
//    return  unityDelegate.rootViewController;
//#else
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
//    NSLog(@"object return topVC");
    return topVC;
//#endif
    
}

- (void)showMessage:(NSString*)stringTip
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
    {
        
#ifdef __IPHONE_9_0
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                       message:stringTip
                                                                preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定"
                                                           style:(UIAlertActionStyleDefault)
                                                         handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"点击了确定");
                                   }];
        
        [alert addAction:okAction];
        
        //ZHNavigationController* nav = (ZHNavigationController*)self->mm_drawerController.centerViewController;
        [[self appRootController] presentViewController:alert animated:YES completion:nil];
#endif
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:stringTip
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"确定", nil];
        [alert show];
        //[alert release];
    }
}

/** 可以获取到view的父容器的控制器的方法,就是这个黑科技. */
- (UIViewController *)getSuperViewController:(UIView *)view
{
    UIResponder *responder = view;
    //循环获取下一个响应者,直到响应者是一个UIViewController类的一个对象为止,然后返回该对象.
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
    }
    return nil;
}


- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
