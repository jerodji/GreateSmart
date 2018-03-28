//
//  NSDictionary+extend.m
//  GreateSmart
//
//  Created by hailin on 2018/3/28.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "NSDictionary+extend.h"

@implementation NSDictionary (extend)

+ (NSDictionary*)dictFromData:(NSData*)data
{
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    return dic;
}

@end
