//
//  STHPersonMessage.h
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface STHPersonMessage : NSObject


/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  描述
 */
@property (nonatomic, copy) NSString *desc;
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  配图
 */
@property (nonatomic, copy) NSString *image;
/**
 *  团购的位置
 */
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@end
