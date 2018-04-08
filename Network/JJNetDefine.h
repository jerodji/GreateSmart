//
//  JJNetDefine.h
//  GreateSmart
//
//  Created by hailin on 2018/3/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <Foundation/Foundation.h>

//超时时间
#define TIMEOUT_INTERVAL 6.0

typedef NS_ENUM(NSInteger, NetType) {
    GET,
    POST
};

typedef void (^SUCC)(id responseObject);
typedef void (^FAIL)(NSURLSessionDataTask * task, NSError* error);

@interface JJNetDefine : NSObject

@end
