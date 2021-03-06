//
//  AFBaseNetwork.m
//  AFBaseNetwork
//
//  Created by Jerod on 2018/1/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "AFBaseNetwork.h"
#import "AFNetworking.h"
//#import <AFHTTPSessionManager.h>
#import "NSObject+conversion.h"

@interface AFBaseNetwork()
@property (nonatomic,strong) AFHTTPSessionManager * sessionManager;
@property (nonatomic,strong) AFHTTPSessionManager * formManager;
@end

@implementation AFBaseNetwork

- (AFHTTPSessionManager *)sessionManager
{
    if (!_sessionManager)
    {
        _sessionManager = [AFHTTPSessionManager manager];//[[AFHTTPSessionManager alloc] init];
        _sessionManager.requestSerializer.timeoutInterval = TIMEOUT_INTERVAL;
        _sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];//[AFSecurityPolicy defaultPolicy];
        _sessionManager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
        //// 设置接收数据为 JSON 数据
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer]; /* 不设置会报-1016或者会有编码问题, 设置了 [AFHTTPResponseSerializer serializer] 会自动转json */
        NSMutableSet *acceptSet = [_sessionManager.responseSerializer.acceptableContentTypes mutableCopy];
        [acceptSet addObject:@"text/plain"];
        [acceptSet addObject:@"text/html"]; /* 不设置会报 error 3840 */
        _sessionManager.responseSerializer.acceptableContentTypes = [acceptSet copy];
        
    }
    return _sessionManager;
}


+ (AFBaseNetwork *)shareIns
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[AFBaseNetwork alloc] init];
    });
    return _sharedObject;
}

- (AFHTTPSessionManager *)formManager
{
    if (!_formManager) {
        _formManager = [AFHTTPSessionManager manager];/* 创建网络请求对象 */
        /* 设置请求和接收的数据编码格式 */
        _formManager.requestSerializer  = [AFHTTPRequestSerializer serializer];// [AFJSONRequestSerializer serializer]; // 设置请求数据为 JSON 数据
        _formManager.responseSerializer = [AFJSONResponseSerializer serializer]; // 设置接收数据为 JSON 数据
        /* 设置请求头 */
//        [_formManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//        [_formManager.requestSerializer setValue:@"xxx" forHTTPHeaderField:@"xxx"];
//        [_formManager.requestSerializer setValue:@"xxx" forHTTPHeaderField:@"xxx"];
        

    }
    return _formManager;
}

#pragma mark- form

- (void)request:(NetType)type URL:(NSString*)url formHeader:(NSDictionary*)formHeaderDict params:(id)params success:(SUCC)success fail:(FAIL)failure
{
    NSString * method = @"POST";
    if (type == GET) {
        method = @"GET";
    }
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:url parameters:params error:nil];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    for (NSString* key in formHeaderDict) {
         [request setValue:formHeaderDict[key] forHTTPHeaderField:key];
    }
    
    request.timeoutInterval = TIMEOUT_INTERVAL;
    
    //发起请求
    __block NSURLSessionDataTask *dataTask = nil;
    
    dataTask = [self.sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            if (success) {
                success(responseObject);
            }
        } else {
            if (failure) {
                failure(dataTask,error);
            }
        }
    }];
    
    [dataTask resume];
}


#pragma mark - entity

- (void)get:(NSString*)urlHead URLFunc:(NSString*)urlFunc paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure
{
    [self request:GET URLHead:urlHead URLFunc:urlFunc paramsEntity:entity success:success fail:failure];
}

- (void)post:(NSString*)urlHead URLFunc:(NSString*)urlFunc paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure
{
    [self request:POST URLHead:urlHead URLFunc:urlFunc paramsEntity:entity success:success fail:failure];
}

- (void)request:(NetType)type URLHead:(NSString*)urlHead URLFunc:(NSString*)urlFunc paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure
{
    if (urlHead == nil || urlFunc == nil) {
        return;
    }
    NSString * fullURL = [urlHead stringByAppendingPathComponent:urlFunc];
    [self request:type URL:fullURL paramsEntity:entity success:success fail:failure];
}

- (void)request:(NetType)type URL:(NSString*)fullURL paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure
{
    NSString * method = @"POST";
    if (type == GET) {
        method = @"GET";
    }
    
    NSDictionary * dict = [entity getIvarDict];
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:fullURL parameters:dict error:nil];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //[request addValue:你需要的accept-id forHTTPHeaderField:@"Accept-Id"];
    //[request addValue:你需要的user-agent forHTTPHeaderField:@"User-Agent"];
    
    //NSData *body = 你需要提交的data;
    //[request setHTTPBody:body];
    
    request.timeoutInterval = TIMEOUT_INTERVAL;
    
    //发起请求
    __block NSURLSessionDataTask *dataTask = nil;
    
    dataTask = [self.sessionManager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            if (success) {
                success(responseObject);
            }
        } else {
            if (failure) {
                failure(dataTask,error);
            }
        }
    }];
    
    [dataTask resume];
}




#pragma mark - dict

- (void)get:(NSString*)_urlHead api:(NSString*)_urlFunc paramsDict:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure
{
    [self request:GET URLHead:_urlHead URLFunc:_urlFunc paramsDict:_parameters success:_success fail:_failure];
}

- (void)post:(NSString*)_urlHead api:(NSString*)_urlFunc paramsDict:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure
{
    [self request:POST URLHead:_urlHead URLFunc:_urlFunc paramsDict:_parameters success:_success fail:_failure];
}

- (void)request:(NetType)_type URLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc paramsDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure
{
    if (nil==_urlHead || _urlHead.length==0) {return;}
    if ( (nil == _urlFunc) || (_urlFunc.length == 0) ) {return;}
    
    // fullURL
    NSString * fullURL = [NSString stringWithFormat:@"%@%@", _urlHead, _urlFunc];
    JJLog(@"fullURL >> %@",fullURL);
    
    if (_type == POST)
    {
        [self.sessionManager POST:fullURL parameters:_parameter progress:nil success:^(NSURLSessionDataTask* Task,id responseObject){
            
            _success(responseObject);
            
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            //JJLog(@"总有刁民害朕 %@ \n任务信息 : %@ \n错误信息 : %@",fullURL,task,error);
            _failure(task, error);
        }];
    }
    else
    {
        [self.sessionManager GET:fullURL parameters:_parameter progress:nil success:^(NSURLSessionDataTask* Task,id responseObject){
            
            _success(responseObject);
            
        } failure:^(NSURLSessionDataTask* Task, NSError* Err){
            
            //JJLog(@"总有刁民害朕 %@  \n任务信息 : %@ \n错误信息 : %@",fullURL,Task,Err);
            _failure(Task, Err);
        }];
    }
    
}

- (void)request:(NetType)_type URL:(NSString*)_url paramsDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure
{
    if ( (nil == _url) || (_url.length == 0) ) {
        JJLog(@"uclog | _url is nil, networking request error");
        return;
    }
    
    if (_type == GET)
    {
        [self.sessionManager GET:_url parameters:_parameter progress:nil success:^(NSURLSessionDataTask* Task,id ResponseObject){
            
            _success(ResponseObject);
            
        }failure:^(NSURLSessionDataTask* task, NSError* error){
            
            //JJLog(@"full 总有刁民害朕 %@ \n任务信息 : %@ \n错误信息 : %@",_url,task,error);
            _failure(task,error);
        }];
    }
    else
    {
        [self.sessionManager POST:_url parameters:_parameter progress:nil success:^(NSURLSessionDataTask* Task,id responseObject){
            
            _success(responseObject);
            
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            
            //JJLog(@"full 总有刁民害朕 %@ \n任务信息 : %@ \n错误信息 : %@",_url,task,error);
            _failure(task,error);
        }];
    }
    
}


#pragma mark- upload

- (void)uploadDataWithURLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc parameters:(NSDictionary*)_parameters data:(NSData*)_data name:(NSString*)_name fileName:(NSString*)_fileName mimeType:(NSString*)_mimeType success:(SUCC)_success failure:(FAIL)_failure progress:(void (^)(CGFloat progres))_progress
{
    if ( (nil == _urlHead) || (_urlHead.length == 0) ) {
        JJLog(@" _urlFunc is nil");
        return;
    }
    if ( (nil == _urlFunc) || (_urlFunc.length == 0) ) {
        JJLog(@" _urlFunc is nil");
        return;
    }
    
    NSString * fullURL = @"";
    fullURL = [NSString stringWithFormat:@"%@%@", _urlHead, _urlFunc];
    JJLog(@"上传 %@",fullURL);
    
    //====== upload =====
    [self.sessionManager POST:fullURL parameters:_parameters
    constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传文件参数
        [formData appendPartWithFileData:_data name:_name fileName:_fileName mimeType:_mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        JJLog(@"上传进度 %.2lf%%",progress);
        
        _progress(progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        JJLog(@"请求成功：%@",responseObject);
        _success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        JJLog(@"请求失败：%@",error);
        _failure(task, error);
    }];
    
}


- (void)uploadDataWithFullURL:(NSString*)_fullURL parameters:(NSDictionary*)_parameters data:(NSData*)_data name:(NSString*)_name fileName:(NSString*)_fileName success:(SUCC)_success failure:(FAIL)_failure
{
    [self.sessionManager POST:_fullURL parameters:_parameters
    constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传文件参数
        [formData appendPartWithFileData:_data name:_name fileName:_fileName mimeType:@"jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        JJLog(@"%.2lf%%",progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        //        JJLog(@"请求成功：%@",responseObject);
        _success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        //        JJLog(@"请求失败：%@",error);
        _failure(task,error);
    }];
    
}

@end
