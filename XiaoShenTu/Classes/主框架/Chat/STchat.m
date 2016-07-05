//
//  STchat.m
//  XiaoShenTu
//
//  Created by a on 16/7/3.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STchat.h"

@implementation STchat

-(id) initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        self.name =dict[@"name"];
        self.icon = dict[@"icon"];
        self.time = dict[@"time"];
        self.content = dict[@"content"];
    }
    return self;
}

//必须实现的类方法，否则类无法alloc 自己（self）
+(id) chatWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
