//
//  STGuideCell.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/27.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STGuideCell.h"
#import "STTabBarController.h"

@interface STGuideCell ()

//背景的图片框
@property (nonatomic, weak) UIImageView *imgView;


@end
@implementation STGuideCell


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
//    1.创建图片框
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imgView.backgroundColor = XRandomColor;
    
    
//    2.添加
    [self.contentView addSubview:imgView];
    
//    3.赋值
    _imgView  = imgView;
    
//    4.立即体验按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
//    让按钮根据图片调整大小
    [btn sizeToFit];
    
    btn.x = (self.width - btn.width) * 0.5;
    btn.y = self.height * 0.85;
    
//    按钮默认隐藏
    btn.hidden = YES;
    
    [self addSubview:btn];
//    赋值
    _experienceBtn = btn;
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
     }
    
    
    return self;
}

- (void)btnClick{

//    1.获取应用程序对象
    UIApplication *app = [UIApplication sharedApplication];
    
    app.keyWindow.rootViewController = [[STTabBarController alloc]init];
    

}
#pragma mark - 重写图片的 set 方法设置图片
-(void)setBackgroundImage:(UIImage *)backgroundImage{

    _backgroundImage = backgroundImage;
    
    self.imgView.image =  backgroundImage;

}


@end
