//
//  UILabel+extend.h
//  GreateSmart
//
//  Created by hailin on 2018/3/30.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (extend)

- (void)layerShadowWithColor:(CGColorRef)color opacity:(float)opacity Radius:(CGFloat)radius Offset:(CGSize)Offset cornerRadius:(CGFloat)corner;

@end
