//
//  CommonFiles.h
//  XiaoShenTu
//
//  Created by 张云飞 on 16/7/4.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#ifndef CommonFiles_h
#define CommonFiles_h


#define KGaoDeKey  @"38059dad5bc19bddfa2c6c82c777c1cd"

//通知
//首页的通知
#define KOpenPersonDetailNoti @"KOpenPersonDetailNoti"
#define KClosePersonDetailNoti  @"KClosePersonDetailNoti"



#define XScaleHeight(height) XScreenH/1334*height
#define XScaleWidth(width) XScreenW/750*width


//     fitScreenHeight= height*(SCREEN_HEIGHT/568)

#define XScreenW [UIScreen mainScreen].bounds.size.width
#define XScreenH [UIScreen mainScreen].bounds.size.height


#define XRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0  blue:arc4random_uniform(256)/255.0  alpha:1.0]



#pragma mark - 打印宏
#ifdef __OBJC__

#ifdef DEBUG
#define XLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif

#endif /* CommonFiles_h */
