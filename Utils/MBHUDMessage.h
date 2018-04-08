//
//  MBHUDMessage.h
//  GreateSmart
//
//  Created by hailin on 2018/4/8.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 利用 MBProgressHUD 展示信息
 */
@interface MBHUDMessage : NSObject

+ (void)showMsg:(NSString*)msg;

@end
