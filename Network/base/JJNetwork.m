//
//  JJNetwork.m
//  GreateSmart
//
//  Created by hailin on 2018/3/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "JJNetwork.h"
#import "NSObject+conversion.h"

@implementation JJNetwork

+ (JJNetwork *)shareIns
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[JJNetwork alloc] init];
    });
    return _sharedObject;
}

//表单请求
- (void)formRequest:(NetType)type URL:(NSString*)fullURL
        formHeaders:(NSDictionary*)formHeader
               body:(id)formBody
            success:(void (^)(NSHTTPURLResponse*, id))successBlock
               fail:(void (^)(NSURLSessionDataTask*, NSError*))failBlock
{
    NSString * method = @"POST";
    if (type == GET) { method = @"GET";}
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:fullURL]];
    [request setHTTPMethod: method];
    request.timeoutInterval = TIMEOUT_INTERVAL;
    
    if (formHeader != nil) {
        for (NSString* key in formHeader.allKeys) {
            [request setValue:formHeader[key] forHTTPHeaderField:key];
        }
    }
    
    //添加 表单 body, 参数
    if (formBody != nil)
    {
        // body 为键值对
        if ([formBody isKindOfClass:[NSDictionary class]])
        {
            NSDictionary* bodyDict = (NSDictionary*)formBody;
            NSMutableString* apdStr = [[NSMutableString alloc] init];
            for (NSString* key in bodyDict) {
                NSString* value = [NSString stringWithFormat:@"%@",bodyDict[key]];
                [apdStr appendString:@"&"];
                [apdStr appendString:[NSString stringWithFormat:@"%@=%@",key,value]];
            }
            NSString* bodyStr = [apdStr substringFromIndex:1];
            NSLog(@"form body : %@",bodyStr);
            NSData* bodyData  = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
            
            [request setHTTPBody:bodyData];
        }
        // body 为单值
        else
        {
            NSString* body = [NSString stringWithFormat:@"%@",formBody];
            NSData* data = [body dataUsingEncoding:NSUTF8StringEncoding];
            [request setHTTPBody:data];
        }
    }
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask = nil;
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"返回的数据 data : %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        if (error == nil) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSHTTPURLResponse* res = (NSHTTPURLResponse*)response;//转换类型 以 便于取statusCode
            successBlock(res,dict);
        }
        else {
            failBlock(dataTask,error);
        }
    }];
    
    [dataTask resume];
}

- (void)request:(NetType)type URL:(NSString*)fullURL formHeaders:(NSDictionary*)headerDict body:(NSDictionary*)bodyDict params:(id)params callback:(SEL)selector {

}

@end
