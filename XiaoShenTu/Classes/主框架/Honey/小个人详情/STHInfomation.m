//
//  STHInfomation.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/29.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STHInfomation.h"

@implementation STHInfomation

+(instancetype)infomationWithDict:(NSDictionary *)dict{
    
    STHInfomation *infomation = [[STHInfomation alloc]init];
    
    [infomation setValuesForKeysWithDictionary:dict];
    
    return infomation;

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

        NSLog(@"%@:%@",key,value);

}

@end
