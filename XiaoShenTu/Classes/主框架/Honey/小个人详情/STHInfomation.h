//
//  STHInfomation.h
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/29.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STHInfomation : NSObject


@property (nonatomic, copy) NSString *imgName;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *version;

@property (nonatomic, assign) BOOL upgrade;
@property (nonatomic, assign) BOOL weiliao;
@property (nonatomic, assign) BOOL call;
@property (nonatomic, assign) BOOL listen;
@property (nonatomic, assign) BOOL emergency;

+(instancetype)infomationWithDict:(NSDictionary *)dict;





@end
