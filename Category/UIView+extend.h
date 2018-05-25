//
//  UIView+extend.h
//  GreateSmart
//
//  Created by hailin on 2018/3/30.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (viewFrame)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
@end

@interface UIView (extend)

/** 设置阴影 */
- (void)shadowWithColor:(CGColorRef)color opacity:(float)opacity Radius:(CGFloat)radius Offset:(CGSize)Offset;

@end


@interface UIView (current)

/**
 * view的上一级响应者 vc
 */
- (UIViewController *)viewController;
- (UINavigationController *)navigationController;

/**
 * 当前窗口最顶端的view
 */
+ (UIView *)getCurrentView;

@end
