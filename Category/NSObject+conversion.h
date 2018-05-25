//
//  NSObject+conversion.h
//  GreateSmart
//
//  Created by hailin on 2018/3/8.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (conversion)

@property (nonatomic, strong) NSMutableDictionary * _Nullable params;

/** 将对象的属性转成字典 */
- (nullable NSDictionary*)getPropertyDict;

/** 获取变量字典 */
- (nullable NSDictionary*)getIvarDict;

/** 获取对应的集合 */
- (nullable id)getObjectInternal;

@end



@interface NSObject (JSONHandle)

/** JSON对象转换为NSData */
- (nullable NSData *)json_toData;
/** JSON对象转换为String */
- (nullable NSString *)json_toString;
/** JSON对象转换为Dictionary */
- (nullable NSDictionary*)json_toDictionary;


//+ (NSObject*)jsonHandler;
/** 将JSONString转换为对象 */
+ (nullable id)json_objectFromJSONString:(nullable NSString *)jsonString;
/** 将JSONSData转换为对象 */
+ (nullable id)json_objectFromJSONData:(nullable NSData *)jsonData;
//- (NSDictionary*)dictFromData:(NSData*)data;

@end
