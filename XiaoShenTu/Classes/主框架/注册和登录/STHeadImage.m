//
//  STHeadImage.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/6.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STHeadImage.h"

@interface STHeadImage ()
@property (nonatomic, strong) UIImageView *headImgView;

@end
@implementation STHeadImage

-(STHeadImage *)init{

    self = [super init];
    
    _headImgView = (STHeadImage *)[[UIImageView alloc]init];
    _headImgView.image = [UIImage imageNamed:@"dingwei"];
    
    
//    84 * 84
    UIImageView *headImg = [[UIImageView alloc]initWithFrame:CGRectMake(XScaleWidth(2), XScaleWidth(2), XScaleWidth(84), XScaleWidth(84))];
    
    [_headImgView addSubview:headImg];
    
    
    return self;
}
@end
