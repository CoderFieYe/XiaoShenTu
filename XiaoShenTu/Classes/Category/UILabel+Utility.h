//
//  UILabel+Utility.h
//  Biyouwoshi
//
//  Created by 万启鹏 on 15/7/8.
//  Copyright (c) 2015年 BU54. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Utility)
+ (UILabel *)labelWithTitle:(NSString *)Title
                       font:(UIFont *)nfont
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor
                      Frame:(CGRect)frame;
@end
