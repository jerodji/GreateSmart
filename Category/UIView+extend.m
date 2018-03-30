//
//  UIView+extend.m
//  GreateSmart
//
//  Created by hailin on 2018/3/30.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "UIView+extend.h"

@implementation UIView (extend)

- (void)shadowWithColor:(CGColorRef)color opacity:(float)opacity Radius:(CGFloat)radius Offset:(CGSize)Offset
{
    self.layer.shadowColor   = color;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius  = radius;
    self.layer.shadowOffset  = Offset;
}

@end
