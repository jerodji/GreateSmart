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
- (void)request:(NetType)type URL:(NSString*)fullURL formHeaders:(NSDictionary*)headerDict body:(NSDictionary*)bodyDict success:(SUCC)successBlock fail:(FAIL)failBlock
{
    NSString * method = @"POST";
    if (type == GET) { method = @"GET";}
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:fullURL]];
    
    [request setHTTPMethod: method];
    
    if (headerDict != nil) {
        for (NSString* key in headerDict.allKeys) {
            [request setValue:headerDict[key] forHTTPHeaderField:key];
        }
    }
    
    //添加 表单 body, 参数
    if (bodyDict != nil) {
        NSMutableString* apdStr = [[NSMutableString alloc] init];
        for (NSString* key in bodyDict) {
            NSString* value = [NSString stringWithFormat:@"%@",bodyDict[key]];
            [apdStr appendString:@"&"];
            [apdStr appendString:[NSString stringWithFormat:@"%@=%@",key,value]];
        }
        NSString* bodyStr = [apdStr substringFromIndex:1];
        NSLog(@"body : %@",bodyStr);
        NSData* bodyData  = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPBody:bodyData];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask = nil;
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //NSLog(@"返回的数据 : %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        if (error == nil) {
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            //NSDictionary * dict = [NSDictionary dictFromData:data];
            successBlock(dict);
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
