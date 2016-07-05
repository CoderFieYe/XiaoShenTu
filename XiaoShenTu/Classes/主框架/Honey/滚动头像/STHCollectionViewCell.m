//
//  STHCollectionViewCell.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STHCollectionViewCell.h"


@interface STHCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation STHCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    self.frame =CGRectMake(0, 0, XScaleWidth(76), XScaleWidth(76));
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, XScaleWidth(76), XScaleWidth(76))];
    
    self.imgView = imgView;
    
    self.center = imgView.center;
    
    [self addSubview:imgView];
    
    return self;
}

- (void)setImage:(NSString *)image {
    _image = [image copy];
    
    self.imgView.image = [UIImage imageNamed:image];
}


-(void)setCollection:(STHCollection *)collection{
 
    _collection = collection;
    
    self.imgView.image = [UIImage imageNamed:collection.imgName];
    
}

@end
