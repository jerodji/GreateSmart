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

@interface AFBaseNetwork()
@property (nonatomic,strong) AFHTTPSessionManager * sessionManager;
@end

@implementation AFBaseNetwork

- (AFHTTPSessionManager *)sessionManager
{
    if (!_sessionManager)
    {
        _sessionManager = [[AFHTTPSessionManager alloc] init];
        NSMutableSet *acceptSet = [_sessionManager.responseSerializer.acceptableContentTypes mutableCopy];
        [acceptSet addObject:@"text/plain"];
        [acceptSet addObject:@"text/html"];
        
        _sessionManager.requestSerializer.timeoutInterval = 15;
        _sessionManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
        _sessionManager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
        _sessionManager.responseSerializer.acceptableContentTypes = [acceptSet copy];
    }
    return _sessionManager;
}


+ (AFBaseNetwork *)sharedInstance
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[AFBaseNetwork alloc] init];
    });
    return _sharedObject;
}

- (void)get:(NSString*)_urlHead api:(NSString*)_urlFunc params:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure
{
    [self request:GET URLHead:_urlHead URLFunc:_urlFunc params:_parameters success:_success fail:_failure];
}

- (void)post:(NSString*)_urlHead api:(NSString*)_urlFunc params:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure
{
    [self request:POST URLHead:_urlHead URLFunc:_urlFunc params:_parameters success:_success fail:_failure];
}

#pragma mark URLFunc

- (void)request:(NetType)_type URLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc params:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure
{
    if (nil==_urlHead || _urlHead.length==0) {return;}
    if ( (nil == _urlFunc) || (_urlFunc.length == 0) ) {return;}
    
    // fullURL
    NSString * fullURL = [NSString stringWithFormat:@"%@/%@", _urlHead, _urlFunc];
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

#pragma mark fullURL

- (void)request:(NetType)_type fullURL:(NSString*)_url parameterDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure
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


#pragma mark upload

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
    
    //===== fullURL =====
    NSString * fullURL = @"";
    fullURL = [NSString stringWithFormat:@"%@%@", _urlHead, _urlFunc];
    JJLog(@"%@",fullURL);
    
    //====== upload =====
    [self.sessionManager POST:fullURL parameters:_parameters
    constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传文件参数
        [formData appendPartWithFileData:_data name:_name fileName:_fileName mimeType:_mimeType];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        JJLog(@"上传进度 %.2lf%%",progress);
        
        _progress(progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        //        JJLog(@"请求成功：%@",responseObject);
        _success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        //        JJLog(@"请求失败：%@",error);
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
