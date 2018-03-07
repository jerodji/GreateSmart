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

/**
 *  http get request
 */
- (void)get:(NSString*)_urlHead api:(NSString*)_urlFunc params:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure;

/**
 *  http post request
 */
- (void)post:(NSString*)_urlHead api:(NSString*)_urlFunc params:(NSDictionary*)_parameters success:(SUCC)_success fail:(FAIL)_failure;



/**
 *  http request with head and func
 */
- (void)request:(NetType)_type URLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc params:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure;

/**
 *  http request with full url
 */
- (void)request:(NetType)_type fullURL:(NSString*)_url parameterDict:(NSDictionary*)_parameter success:(SUCC)_success fail:(FAIL)_failure;



/**
 *  upload data request
 */
- (void)uploadDataWithURLHead:(NSString*)_urlHead URLFunc:(NSString*)_urlFunc parameters:(NSDictionary*)_parameters data:(NSData*)_data name:(NSString*)_name fileName:(NSString*)_fileName mimeType:(NSString*)_mimeType success:(SUCC)_success failure:(FAIL)_failure progress:(void (^)(CGFloat progres))_progress;



@end
