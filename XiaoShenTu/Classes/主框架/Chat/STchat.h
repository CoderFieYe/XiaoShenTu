//
//  STchat.h
//  XiaoShenTu
//
//  Created by a on 16/7/3.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STchat : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *content;

-(id) initWithDict:(NSDictionary *)dict;
+(id) chatWithDict:(NSDictionary *)dict;
@end
