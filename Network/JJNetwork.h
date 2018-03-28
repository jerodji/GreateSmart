//
//  JJNetwork.h
//  GreateSmart
//
//  Created by hailin on 2018/3/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJNetDefine.h"
#import "NSDictionary+extend.h"

//typedef NS_ENUM(NSInteger, JJRequestMethod) {
//    GET,
//    POST
//};

//typedef void (^SUCC)(id responseObject);
//typedef void (^FAIL)(NSURLSessionDataTask * task, NSError* error);

@interface JJNetwork : NSObject

+ (JJNetwork *)shareIns;

#pragma mark form表单请求
/**
 设置表单的请求封装
 
 @param type POST/GET
 @param headerDict 表单请求头 header
 @param bodyDict 表单请求体 body
 @param fullURL url
 @param params 参数- 字典/实体类
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
- (void)request:(NetType)type URL:(NSString*)fullURL formHeaders:(NSDictionary*)headerDict body:(NSDictionary*)bodyDict params:(id)params success:(SUCC)successBlock fail:(FAIL)failBlock;

@end
