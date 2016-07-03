//
//  STHCollection.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/30.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STHCollection.h"

@implementation STHCollection


+(instancetype)collectionWithDict:(NSDictionary *)dict{

    STHCollection *collection = [[STHCollection alloc]init];
    
    [collection setValuesForKeysWithDictionary:dict];
    
    return collection;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

    NSLog(@"%@,%@", key, value);

}

@end
