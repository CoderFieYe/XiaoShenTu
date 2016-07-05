//
//  STPhoto.h
//  XiaoShenTu
//
//  Created by a on 16/7/4.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STPhoto : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *nick;
@property (nonatomic,copy) NSString *forward;
@property (nonatomic,copy) NSString *photo;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *share;

@property (nonatomic, assign) BOOL isOpening;
@property (nonatomic, assign, readonly) BOOL shouldShowMoreButton;

-(id) initWithDict:(NSDictionary *)dict;
+(id) chatWithDict:(NSDictionary *)dict;
@end
