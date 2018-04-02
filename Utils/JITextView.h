//
//  JITextView.h
//  GreateSmart
//
//  Created by hailin on 2018/4/2.
//  Copyright © 2018年 Jerod. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JITextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end
