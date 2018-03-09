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

/**
 *  将对象的属性转成字典
 */
- (nullable NSDictionary*)getPropertyDict;

/**
 *  获取变量字典
 */
- (nullable NSDictionary*)getIvarDict;

/**
 *  获取对应的集合
 */
- (nullable id)getObjectInternal;

@end



@interface NSObject (JSONHandle)

/**
 *  对象转换为JSONData
 */
- (nullable NSData *)JSONData;

/**
 *  对象转换为JSONString
 */
- (nullable NSString *)JSONString;

/**
 *  将JSONString转换为对象
 */
+ (nullable id)objectFromJSONString:(nullable NSString *)jsonString;

/**
 *  将JSONSData转换为对象
 */
+ (nullable id)objectFromJSONData:(nullable NSData *)jsonData;

@end
