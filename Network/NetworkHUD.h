//
//  NetworkHUD.h
//  GreateSmart
//
//  Created by hailin on 2018/3/29.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJNetDefine.h"

@interface NetworkHUD : NSObject

+ (NetworkHUD *)shareIns;

/**
 form表单请求
 */
- (void)request:(NetType)type URL:(NSString*)fullURL formHeaders:(NSDictionary*)headerDict body:(NSDictionary*)bodyDict params:(id)params success:(SUCC)successBlock fail:(FAIL)failBlock showHUD:(BOOL)showhud;

/**
 网络请求 参数-实体类(对象)
 */
- (void)request:(NetType)type URL:(NSString*)fullURL paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure showHUD:(BOOL)showhud;

/**
 网络请求 参数-字典
 */
- (void)request:(NetType)_type URL:(NSString*)_url paramsDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure showHUD:(BOOL)showhud;

@end
