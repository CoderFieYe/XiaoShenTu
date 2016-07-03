//
//  UIButton+Utility.h
//  Biyouwoshi
//
//  Created by 万启鹏 on 15/7/8.
//  Copyright (c) 2015年 BU54. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Utility)
+ (UIButton *)noActionButtonWithFrame:(CGRect)frame
                                image:(NSString *)imageName;

+ (UIButton *)noActionTitleButtonWithFrame:(CGRect)frame
                                     title:(NSString *)title
                                 textColor:(UIColor *)textColor
                                  fontSize:(UIFont *)font
                           backgroundColor:(UIColor *)backgroundColor;

+ (UIButton *)checkButtonWithFrame:(CGRect)frame
                             image:(NSString *)imageName
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                          fontSize:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action;

+ (UIButton *)imageButtonWithFrame:(CGRect)frame
                             image:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action;

+ (UIButton *)titleButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action;

+ (UIButton *)titleButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                          fontSize:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action;
@end
