//
//  NSString+STExtension.m
//  XiaoShenTu
//
//  Created by a on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "NSString+STExtension.h"

@implementation NSString (STExtension)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    // 获得系统版本
    if (is_ios7) {
        return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    } else {
        return [self sizeWithFont:font constrainedToSize:maxSize];
    }
}
- (CGSize)sizeWithFont:(UIFont *)font
{
   return  [self sizeWithFont:font maxW:MAXFLOAT];
}

@end
