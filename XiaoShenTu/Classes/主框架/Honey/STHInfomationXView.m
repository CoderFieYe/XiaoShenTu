//
//  STHInfomationXView.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STHInfomationXView.h"
#import "UIButton+Utility.h"
#import "UILabel+Utility.h"

@interface STHInfomationXView ()

@end


@implementation STHInfomationXView

-(void)setInfomation:(STHInfomation *)infomation{

    
    
#define XScaleWidth(width) XScreenW/750*width
#define XScaleHeight(height) XScreenH/667*2*height_infomation = infomation;
    
    [self.ImgBtn setImage:[UIImage imageNamed:infomation.imgName] forState:UIControlStateNormal];
    
    self.daBabyLab.text = infomation.name;
    
    self.versionLab.text = infomation.version;
    
//    假
    self.upGradeLab.textColor = [UIColor blueColor];
    

}

+(instancetype)InfomationView{

    return [[[NSBundle mainBundle]loadNibNamed:@"STHInfomationXView" owner:nil options:nil] lastObject];

}
+ (instancetype)InfomationViewWithModel:(STHInfomation *)infomation{
    
    STHInfomationXView *infomationXView = [self InfomationView];
    
    infomationXView.infomation = infomation;
    
    return infomationXView;
    
}


// 方法
-(void)touxiangClick:(UIButton *)btn{
    
    NSLog(@"头像被点击");
    
}

//}
//
//+(instancetype)appViewWithApp:(HMApp *)app
//{
//    HMAppView *appView = [self appView];
//    appView.app = app;
//    return appView;
//}

//-(instancetype)initWithFrame:(CGRect)frame{
//
//    self = [super initWithFrame:frame];
//    
////    [self setupUI];
//    UIView *view = [[NSBundle mainBundle]loadNibNamed:@"STHInfomationXView" owner:self options:nil][0];
////38 + 30
//    view.frame = CGRectMake(0, 0, XScreenW, 68);
//    
//
//    
////    self.upGradeLab.textColor = [UIColor redColor];
//    [self addSubview:view];
//
//    
//    return self;
//
//}

//-(void)setupUI{
//
//    UIButton *imgBtn = [UIButton  imageButtonWithFrame:CGRectMake(0, 0, 38, 38) image:@"touxiang" target:self action:@selector(touxiangClick:)];
//    self.ImgBtn = imgBtn;
//    
//    UILabel *daLab = [UILabel labelWithTitle:@"大宝贝" font:kFontSize17 textColor:[UIColor colorWithHexString:@"#333333"] backgroundColor:nil Frame:CGRectMake(0, 0, 200, 44)];
//    
//    
//
//    
//
//}


@end
