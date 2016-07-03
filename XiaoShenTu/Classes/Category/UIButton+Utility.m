//
//  UIButton+Utility.m
//  Biyouwoshi
//
//  Created by 万启鹏 on 15/7/8.
//  Copyright (c) 2015年 BU54. All rights reserved.
//

#define kInterval 10

#import "UIButton+Utility.h"

@implementation UIButton (Utility)
+ (UIButton *)noActionButtonWithFrame:(CGRect)frame
                             image:(NSString *)imageName
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return button;
}

+ (UIButton *)noActionTitleButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                          fontSize:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (font!=nil) {
        button.titleLabel.font = font;
    }
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    return button;
}

+ (UIButton *)checkButtonWithFrame:(CGRect)frame
                             image:(NSString *)imageName
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                          fontSize:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    if (font!=nil) {
        button.titleLabel.font = font;
    }
    [button setFrame:frame];
    [button setBackgroundColor:backgroundColor];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(kInterval, kInterval, kInterval, frame.size.width-3*kInterval)];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(kInterval, 15, kInterval, 0)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)imageButtonWithFrame:(CGRect)frame
                             image:(NSString *)imageName
                            target:(id)target
                            action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


+ (UIButton *)titleButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)titleButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                         textColor:(UIColor *)textColor
                          fontSize:(UIFont *)font
                   backgroundColor:(UIColor *)backgroundColor
                            target:(id)target
                            action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = font;
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setBackgroundColor:backgroundColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
