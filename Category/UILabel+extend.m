//
//  UILabel+extend.m
//  GreateSmart
//
//  Created by hailin on 2018/3/30.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import "UILabel+extend.h"

@implementation UILabel (extend)

//方法无效, 待修进水电费
- (void)layerShadowWithColor:(CGColorRef)color opacity:(float)opacity Radius:(CGFloat)radius Offset:(CGSize)Offset cornerRadius:(CGFloat)corner
{
    //    UIView* shadowView = [[UIView alloc] init];
    
    
    CALayer *subLayer = [CALayer layer];
    subLayer.shadowColor   = color;
    subLayer.shadowOpacity = opacity;
    subLayer.shadowRadius  = 5;
    subLayer.shadowOffset  = Offset;
    subLayer.masksToBounds = NO;
    subLayer.backgroundColor = [UIColor greenColor].CGColor;
    subLayer.position = CGPointMake(355.0/2, 50.0/2);
    subLayer.bounds = CGRectMake(0, 0, 355, 50);
    //    self.layer.cornerRadius = 10;
    //    self.layer.masksToBounds = YES;
    //    [self.layer insertSublayer:subLayer below:self.layer];
    [self.layer addSublayer:subLayer];
    
    CALayer *corLayer = [CALayer layer];
    corLayer.cornerRadius = 10;
    corLayer.masksToBounds = YES;
    corLayer.backgroundColor = [UIColor redColor].CGColor;
    [subLayer addSublayer:corLayer];
    
    
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
}

@end
