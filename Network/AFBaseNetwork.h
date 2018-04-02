//
//  AFBaseNetwork.h
//  AFBaseNetwork
//
//  Created by Jerod on 2018/1/20.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JJNetDefine.h"

#ifdef DEBUG
#define JJLog(format, ...) NSLog((@"%s " "%s(%d)\n" format "\n--------------------------------------------------------"), __PRETTY_FUNCTION__, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, ##__VA_ARGS__);
#else
#define JJLog(format, ...)
#endif

@interface AFBaseNetwork : NSObject

+ (AFBaseNetwork*)shareIns;

/**
 设置 form header 表单头
 参数以 json 形式
 */
- (void)request:(NetType)type URL:(NSString*)url formHeader:(NSDictionary*)formHeaderDict params:(NSDictionary*)params success:(SUCC)success fail:(FAIL)failure;

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
 网络请求 参数-实体类(对象)

 @param type GET/POST
 @param fullURL full url
 @param entity 参数: 对象
 @param success succ
 @param failure fail
 */
- (void)request:(NetType)type URL:(NSString*)fullURL paramsEntity:(id)entity success:(SUCC)success fail:(FAIL)failure;


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
 网络请求 参数-字典

 @param _type GET / POST
 @param _url full url
 @param _parameter 字典参数
 @param _success succ
 @param _failure fail
 */
- (void)request:(NetType)_type URL:(NSString*)_url paramsDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure;


#pragma mark - 上传

/**
 上传

 @param _urlHead 请求url地址
 @param _urlFunc api
 @param _parameters 参数 - dict
 @param _data 上传的data
 @param _name name
 @param _fileName 文件名
 @param _mimeType 文件格式,后缀名
 @param _success 成功回调
 @param _failure 失败回调
 @param _progress 进度回调
 */
- (void)uploadDataWithURLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc parameters:(NSDictionary*)_parameters data:(NSData*)_data name:(NSString*)_name fileName:(NSString*)_fileName mimeType:(NSString*)_mimeType success:(SUCC)_success failure:(FAIL)_failure progress:(void (^)(CGFloat progres))_progress;



@end
