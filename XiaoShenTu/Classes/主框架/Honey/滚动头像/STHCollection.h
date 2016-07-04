//
//  STHCollection.h
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/30.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STHCollection : NSObject

@property (nonatomic, copy) NSString *imgName;

+(instancetype)collectionWithDict:(NSDictionary *)dict;

@end
