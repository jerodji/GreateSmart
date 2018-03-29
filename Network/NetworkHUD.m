//
//  NetworkHUD.m
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "NetworkHUD.h"
#import "JJNetwork.h"
#import "AFBaseNetwork.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+topVC.h"

@implementation NetworkHUD

static NetworkHUD* _ins = nil;
+ (NetworkHUD *)shareIns
{
    if (!_ins) {
        _ins = [[NetworkHUD alloc] init];
    }
    return _ins;
//    static dispatch_once_t pred = 0;
//    __strong static id _sharedObject = nil;
//    dispatch_once(&pred, ^{
//        _sharedObject = [[NetworkHUD alloc] init];
//    });
//    return _sharedObject;
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

- (void)showHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:[self topViewController].view animated:YES];
    });
}

- (void)hideHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:[self topViewController].view animated:YES];
    });
}

/**
 form表单请求
 */
- (void)request:(NetType)type URL:(NSString*)fullURL formHeaders:(NSDictionary*)headerDict body:(NSDictionary*)bodyDict params:(id)params success:(SUCC)successBlock fail:(FAIL)failBlock showHUD:(BOOL)showhud
{
    if (showhud) [self showHUD];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        [[JJNetwork shareIns] request:type URL:fullURL formHeaders:headerDict body:bodyDict params:params success:^(id responseObject) {
            //sleep(3);
            successBlock(responseObject);
            if (showhud) [self hideHUD];
            
        } fail:^(NSURLSessionDataTask *task, NSError *error) {

            failBlock(task,error);
            if (showhud) [self hideHUD];
        }];
    });
}

/**
 网络请求 参数-实体类(对象)
 */
- (void)request:(NetType)type URL:(NSString*)fullURL paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure showHUD:(BOOL)showhud
{
    if (showhud) [self showHUD];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        [[AFBaseNetwork shareIns] request:type URL:fullURL paramsEntity:entity success:^(id responseObject) {
            success(responseObject);
            if (showhud) [self hideHUD];
        } fail:^(NSURLSessionDataTask *task, NSError *error) {
            failure(task,error);
            if (showhud) [self hideHUD];
        }];
        
    });
}

/**
 网络请求 参数-字典
 */
- (void)request:(NetType)_type URL:(NSString*)_url paramsDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure showHUD:(BOOL)showhud
{
    if (showhud) [self showHUD];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        [[AFBaseNetwork shareIns] request:_type URL:_url paramsDict:_parameter success:^(id responseObject) {
            _success(responseObject);
            if (showhud) [self hideHUD];
        } fail:^(NSURLSessionDataTask *task, NSError *error) {
            _failure(task,error);
            if (showhud) [self hideHUD];
        }];
        
    });
}

@end
