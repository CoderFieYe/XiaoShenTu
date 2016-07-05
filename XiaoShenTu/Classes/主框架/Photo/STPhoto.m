//
//  STPhoto.m
//  XiaoShenTu
//
//  Created by a on 16/7/4.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STPhoto.h"

@implementation STPhoto
-(id) initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
       
        self.icon = dict[@"icon"];
        self.nick =dict[@"nick"];
        self.forward = dict[@"forward"];
        self.photo = dict[@"photo"];
        self.time = dict[@"time"];
        self.share = dict[@"share"];
        
    }
    return self;
}

//必须实现的类方法，否则类无法alloc 自己（self）
+(id) chatWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
