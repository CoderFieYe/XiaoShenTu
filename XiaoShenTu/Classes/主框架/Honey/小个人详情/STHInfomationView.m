//
//  STHInfomationView.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "UILabel+Utility.h"
#import "UIButton+Utility.h"

#import "Masonry.h"

#import "STHInfomationView.h"


@interface STHInfomationView ()

@property (nonatomic, weak) UIButton *ImgBtn;
@property (nonatomic, weak) UILabel  *daBabyLab;
@property (nonatomic, weak) UILabel *versionLab;
@property (nonatomic, weak) UILabel *upGradeLab;

@property (nonatomic, weak) UIButton *weiChatBtn;
@property (nonatomic, weak) UIButton *callBtn;
@property (nonatomic, weak) UIButton *superListenBtn;
@property (nonatomic, weak) UIButton *emergencyBtn;
@property (nonatomic, weak) UIButton *juliBtn;



@end
@implementation STHInfomationView

static CGFloat KInterval10 = 10 * 2;
static CGFloat KHeadW38  =  38 * 2;
static CGFloat KHeadH35  =  35 * 2;

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];

    return self;
}

-(void)setupUI{
    
    UIButton *ImgBtn = [[UIButton alloc]init];
    
//    [ImgBtn setBackgroundColor:[UIColor orangeColor]];
    [ImgBtn setImage:[UIImage imageNamed:@"家庭图标"] forState:UIControlStateNormal];
    self.ImgBtn = ImgBtn;
    [self addSubview:ImgBtn];
    
    UILabel *daBabyLab = [[UILabel alloc]init];
    daBabyLab.text = @"大宝贝";
    daBabyLab.textColor =  [UIColor colorWithHexString:@"#333333"];
    daBabyLab.font = [UIFont systemFontOfSize:XScaleWidth(34)];
    self.daBabyLab = daBabyLab;
    [self addSubview:daBabyLab];
    
    UILabel *versionLab = [[UILabel alloc]init];
    versionLab.text = @"T01版";
    versionLab.textColor = [UIColor colorWithHexString:@"#727272"];
    versionLab.font = [UIFont systemFontOfSize:XScaleWidth(22)];
    [versionLab sizeToFit];
    self.versionLab = versionLab;
    [self addSubview:versionLab];
    
    UILabel *upGradeLab = [[UILabel alloc]init];
    upGradeLab.text = @"升级";
    upGradeLab.textColor = [UIColor colorWithHexString:@"#f55b7a"];
    upGradeLab.font = [UIFont systemFontOfSize:XScaleWidth(22)];
    self.upGradeLab = upGradeLab;
    [self addSubview:upGradeLab];
    
    
    UIButton *weiChatBtn = [[UIButton alloc] init];
    [weiChatBtn setImage:[UIImage imageNamed:@"微聊"] forState:UIControlStateNormal];
    self.weiChatBtn = weiChatBtn;
    [self addSubview:weiChatBtn];
    
    UIButton *callBtn = [[UIButton alloc] init];
    [callBtn setImage:[UIImage imageNamed:@"打电话"] forState:UIControlStateNormal];
    self.callBtn = callBtn;
    [self addSubview:callBtn];
    
    UIButton *superListen = [[UIButton alloc] init];
    [superListen setImage:[UIImage imageNamed:@"超能听"] forState:UIControlStateNormal];
    self.superListenBtn = superListen;
    [self addSubview:superListen];
    
    UIButton *emergency = [[UIButton alloc] init];
    [emergency setImage:[UIImage imageNamed:@"紧急呼叫"] forState:UIControlStateNormal];
    self.emergencyBtn = emergency;
    [self addSubview:emergency];
    
    UIButton *juli = [[UIButton alloc]init];
    [juli setImage:[UIImage imageNamed:@"juli"] forState:UIControlStateNormal];
    self.juliBtn = juli;
    [self addSubview:juli];
    
    
 
}

-(void)layoutSubviews{

    [self.ImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(XScaleWidth(KInterval10));
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(XScaleWidth(KHeadW38));
        make.height.mas_equalTo(XScaleWidth(KHeadW38));
//
    }];
    
    [self.daBabyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ImgBtn.mas_right).mas_equalTo(XScaleWidth(KInterval10));
        make.top.equalTo(self.ImgBtn.mas_top);
//        make.width.mas_equalTo(XScaleWidth(150));
//        make.height.mas_equalTo(XScaleWidth(44));
        
    }];
    
    [self.versionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ImgBtn.mas_right).mas_offset(XScaleWidth(KInterval10));
        make.bottom.equalTo(self.ImgBtn.mas_bottom);
//        make.width.mas_equalTo(XScaleWidth(60));
//        make.height.mas_equalTo(XScaleWidth(44));
    }];
    
    [self.upGradeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.versionLab.mas_right).mas_offset(XScaleWidth(KInterval10));
        make.bottom.equalTo(self.ImgBtn.mas_bottom);
//        make.width.mas_equalTo(XScaleWidth(60));
//        make.height.mas_equalTo(XScaleWidth(44));
    }];
    
    [self.juliBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.right.equalTo(self.mas_right).mas_offset(XScaleWidth(- KInterval10));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(XScaleWidth(KHeadW38));
        make.height.mas_equalTo(XScaleWidth(KHeadH35));
    
    }];
    
    [self.emergencyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.juliBtn.mas_left).mas_offset(-XScaleWidth(KInterval10));
         make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(XScaleWidth(KHeadW38));
        make.height.mas_equalTo(XScaleWidth(KHeadH35));
        
    }];

    [self.superListenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.emergencyBtn.mas_left).mas_offset(-XScaleWidth(KInterval10));
        make.width.mas_equalTo(XScaleWidth(KHeadW38));
        make.height.mas_equalTo(XScaleWidth(KHeadH35));
    }];
    
    [self.callBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.superListenBtn.mas_left).mas_equalTo(-XScaleWidth(KInterval10));
        make.width.mas_equalTo(XScaleWidth(KHeadW38));
        make.height.mas_equalTo(XScaleWidth(KHeadH35));
    }];
//
    [self.weiChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.callBtn.mas_left).mas_equalTo(-XScaleWidth(KInterval10));
        make.width.mas_equalTo(XScaleWidth(KHeadW38));
        make.height.mas_equalTo(XScaleWidth(KHeadH35));
    }];

}

-(void)dealloc{
    NSLog(@"小详情被销毁");
}

@end
