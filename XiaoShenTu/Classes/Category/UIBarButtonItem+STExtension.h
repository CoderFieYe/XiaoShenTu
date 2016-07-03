//
//  UIBarButtonItem+STExtension.h
// 
//
//  Created by xiaomage on 15/7/22.
//  Copyright (c) 2015年 万启鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (STExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end
