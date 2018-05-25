//
//  NSObject+conversion.m
//  GreateSmart
//
//  Created by hailin on 2018/3/8.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "NSObject+conversion.h"
#import <objc/runtime.h>

static NSString * PARAM_KEY = @"PARAM_KEY";

@implementation NSObject (conversion)

- (NSMutableDictionary *)params {
    
    NSMutableDictionary * _params = objc_getAssociatedObject(self, &PARAM_KEY);
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, &PARAM_KEY, _params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _params;
}

- (void)setParams:(NSMutableDictionary *)params {
    
    objc_setAssociatedObject(self, &PARAM_KEY, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSDictionary*)getPropertyDict {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([self class], &propsCount);
    
    for(int i = 0;i < propsCount; i++) {
        
        objc_property_t prop = props[i];
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        
        id value = [self valueForKey:propName];
        
        if(value == nil) {
            value = [NSNull null];
        } else {
            value = [value getObjectInternal];
            if (value==nil) {
                value = [NSNull null];
            }
        }
        
        [dic setObject:value forKey:propName];
    }
    
    return dic;
}

- (NSDictionary*)getIvarDict {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    unsigned int ivarCount;
    Ivar * ivars = class_copyIvarList([self class], &ivarCount);
    
    for (int i=0; i<ivarCount ; i++) {
        Ivar ivar = ivars[i];
        NSString * ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        id ivarValue = [self valueForKey:ivarName];
        if (ivarValue == nil) {
            ivarValue = [NSNull null];
        } else {
            ivarValue = [ivarValue getObjectInternal];
            if (ivarValue == nil) {
                ivarValue = [NSNull null];
            }
        }
        
        [dic setObject:ivarValue forKey:ivarName];
    }
    
    return dic;
}

- (id)getObjectInternal {
    
    if([self isKindOfClass:[NSString class]] || [self isKindOfClass:[NSNumber class]] || [self isKindOfClass:[NSNull class]]) {
        return self;
    }
    
    if([self isKindOfClass:[NSArray class]]) {
        
        NSArray * objarr = (NSArray*)self;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        
        for(int i = 0; i < objarr.count; i++) {
            [arr setObject:[[objarr objectAtIndex:i] getObjectInternal] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([self isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *objdic = (NSDictionary*)self;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        
        for(NSString *key in objdic.allKeys) {
            [dic setObject:[[objdic objectForKey:key] getObjectInternal] forKey:key];
        }
        return dic;
    }
    
    return [self getPropertyDict];
}


@end

#pragma mark -

@implementation NSObject (JSONHandle)

/** JSON对象转换为NSData */
- (NSData *)json_toData {
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

/** JSON对象转换为String */
- (NSString *)json_toString{
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return @"";
    }
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

/** JSON对象转换为Dictionary */
- (NSDictionary*)json_toDictionary {
    if ([self isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary*)self;
    }
    
    NSDictionary* dic;
    if ([self isKindOfClass:[NSData class]]) {
        dic = [NSJSONSerialization JSONObjectWithData:(NSData*)self options:NSJSONReadingAllowFragments error:nil];
    } else {
        NSData* data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
        dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    
    return dic;
}


#pragma mark object form JSON

//static NSObject* _json_handler = nil;
//+ (NSObject*)jsonHandler {
//    if (!_json_handler) {
//        _json_handler = [[NSObject alloc] init];
//    }
//    return _json_handler;
//}

/** 将JSONString转换为对象 */
+ (id)json_objectFromJSONString:(NSString *)jsonString{
    id obj = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    return obj;
}

/** 将JSONSData转换为对象 */
+ (nullable id)json_objectFromJSONData:(nullable NSData *)jsonData{
    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
}


//- (NSDictionary*)dictFromData:(NSData*)data {
//
//    if ([data isKindOfClass:[NSDictionary class]]) {
//        return (NSDictionary*)data;
//    }
//
//    NSDictionary* dic;
//    if ([data isKindOfClass:[NSData class]]) {
//        dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    }
//
//    return dic;
//}



@end
