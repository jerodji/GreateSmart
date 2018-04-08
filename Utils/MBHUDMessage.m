//
//  MBHUDMessage.m
//  GreateSmart
//
//  Created by hailin on 2018/4/8.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "MBHUDMessage.h"
#import "AppConfig.h"
#import "MBProgressHUD.h"


@implementation MBHUDMessage

+ (void)showMsg:(NSString*)msg
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.01 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void){
        
        UIViewController* topvc = [[AppConfig shareIns] topViewController];
        
        if (![msg isEqualToString:@""] && ![msg isEqual:[NSNull null]] && msg!=nil)
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:topvc.view animated:YES];
            hud.mode = MBProgressHUDModeText;
            hud.label.text = msg;
            [hud hideAnimated:true afterDelay:2.5];
        }
    });
    
}

@end
