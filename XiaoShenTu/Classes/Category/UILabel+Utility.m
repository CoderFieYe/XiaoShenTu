//
//  UILabel+Utility.m
//  Biyouwoshi
//
//  Created by 万启鹏 on 15/7/8.
//  Copyright (c) 2015年 BU54. All rights reserved.
//

#import "UILabel+Utility.h"

@implementation UILabel (Utility)
+ (UILabel *)labelWithTitle:(NSString *)Title
                       font:(UIFont *)nfont
                  textColor:(UIColor *)textColor
            backgroundColor:(UIColor *)backgroundColor
                      Frame:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text     = Title;
    label.textColor     = textColor;
    label.textAlignment = NSTextAlignmentLeft;
    
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.font            = nfont;
    label.backgroundColor = backgroundColor;
    label.frame = frame;
    return label;
}
@end
