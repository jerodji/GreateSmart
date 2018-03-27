//
//  AFBaseNetwork.h
//  AFBaseNetwork
//
//  Created by Jerod on 2018/1/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef DEBUG
#define JJLog(format, ...) NSLog((@"%s " "%s(%d)\n" format "\n--------------------------------------------------------"), __PRETTY_FUNCTION__, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, ##__VA_ARGS__);
#else
#define JJLog(format, ...)
#endif

typedef NS_ENUM(NSInteger, NetType) {
    GET,
    POST
};

typedef void (^SUCC)(id responseObject);
typedef void (^FAIL)(NSURLSessionDataTask * task, NSError* error);

@interface AFBaseNetwork : NSObject

+ (AFBaseNetwork*)sharedInstance;

#pragma mark - 以实体类为参数

/**
 *  get
 */
- (void)get:(NSString*)urlHead URLFunc:(NSString*)urlFunc paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure;

/**
 *  post
 */
- (void)post:(NSString*)urlHead URLFunc:(NSString*)urlFunc paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure;

/**
 *  request with url head and func
 */
- (void)request:(NetType)type URLHead:(NSString*)urlHead URLFunc:(NSString*)urlFunc paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure;

/**
 *  request with full url
 */
- (void)request:(NetType)type URL:(NSString*)fullURL paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure;


/**
 设置表单的请求封装

 @param type POST/GET
 @param headerDict 表单请求头 header
 @param bodyDict 表单请求体 body
 @param fullURL url
 @param params 参数- 字典/实体类
 @param isEntity params参数是否为实体类
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
- (void)request:(NetType)type formHeaders:(NSDictionary*)headerDict body:(NSDictionary*)bodyDict URL:(NSString*)fullURL params:(id)params isEntity:(BOOL)isEntity success:(SUCC)successBlock fail:(FAIL)failBlock;

#pragma mark - 以字典集合为参数

/**
 *  http get request
 */
- (void)get:(NSString*)_urlHead api:(NSString*)_urlFunc paramsDict:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure;

/**
 *  http post request
 */
- (void)post:(NSString*)_urlHead api:(NSString*)_urlFunc paramsDict:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure;

/**
 *  http request with head and func
 */
- (void)request:(NetType)_type URLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc paramsDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure;

/**
 *  http request with full url
 */
- (void)request:(NetType)_type fullURL:(NSString*)_url parameterDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure;


#pragma mark - 上传

/**
 *  upload data request
 */
- (void)uploadDataWithURLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc parameters:(NSDictionary*)_parameters data:(NSData*)_data name:(NSString*)_name fileName:(NSString*)_fileName mimeType:(NSString*)_mimeType success:(SUCC)_success failure:(FAIL)_failure progress:(void (^)(CGFloat progres))_progress;



@end
