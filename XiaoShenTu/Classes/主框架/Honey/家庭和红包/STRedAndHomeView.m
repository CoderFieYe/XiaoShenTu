//
//  STRedAndHomeView.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/2.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STRedAndHomeView.h"
#import "masonry.h"


@interface STRedAndHomeView ()
@property (nonatomic, weak) UIButton *hongbaoBtn;
@property (nonatomic, weak) UILabel  *hongBaoLab;
@property (nonatomic, weak) UIButton *homeBtn;
@property (nonatomic, weak) UILabel  *homeLab;



@end
@implementation STRedAndHomeView

static CGFloat  KHeadH76  = 76;
//static CGFloat  KHeadW76  = 76;
//static CGFloat  kInterval20  = 20;
//static CGFloat  KHeight136  = 136;

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];

    self.backgroundColor = [UIColor clearColor];
    
    [self setupUI];
    return self;
}

-(void)setupUI{
    
    //    红包按钮
    UIButton *redbtn  = [[UIButton alloc]init];
    redbtn.size = CGSizeMake(KScaleHeight(KHeadH76), KScaleHeight(KHeadH76));
    self.hongbaoBtn = redbtn;
    [redbtn setBackgroundImage:[UIImage imageNamed:@"hongbao"] forState:UIControlStateNormal];

    [redbtn addTarget:self action:@selector(redbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self  addSubview:redbtn];
    
    //    家庭设置
    UILabel *lab1 = [[UILabel alloc]init];
    lab1.text = @"红包";
    lab1.font = [UIFont systemFontOfSize:8];
    lab1.textColor = [UIColor colorWithHexString:@"#ec4728"];

    [lab1 sizeToFit];
    self.hongBaoLab = lab1;
    [self addSubview:lab1];
    
    //    家庭按钮
    UIButton *homeBtn  = [[UIButton alloc]init];

    homeBtn.size = CGSizeMake(KScaleHeight(KHeadH76), KScaleHeight(KHeadH76));
    self.homeBtn = homeBtn;
    [homeBtn setBackgroundImage:[UIImage imageNamed:@"家庭图标"] forState:UIControlStateNormal];
    [homeBtn addTarget:self action:@selector(HomeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self  addSubview:homeBtn];
    
    //    家庭设置
    UILabel *lab = [[UILabel alloc]init];
    lab.text = @"家庭设置";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:8];
    lab.textColor = [UIColor colorWithHexString:@"#000000"];
    [lab sizeToFit];
    self.homeLab = lab;

    [self addSubview:lab];
    
}
-(void)layoutSubviews{

    [self.hongbaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.mas_leading).offset(KScaleWidth(20));
        make.top.equalTo(self.mas_top).offset(KScaleWidth(10));
        
    }];
    [self.hongBaoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.hongbaoBtn.mas_centerX);
        make.top.equalTo(self.hongbaoBtn.mas_bottom).offset(KScaleHeight(6));
        
    }];

    [self.homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hongBaoLab.mas_bottom).offset(KScaleWidth(6));
        make.leading.mas_equalTo(self.mas_leading).offset(KScaleWidth(20));
        
    }];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeBtn.mas_centerX);
        make.top.equalTo(self.homeBtn.mas_bottom).offset(KScaleWidth(6));
    }];


}

// 按钮点击方法
-(void)redbtnClick{

    NSLog(@"快快发红包");

}
-(void)HomeBtnClick{

    NSLog(@"👪按钮被点击");


}
@end
