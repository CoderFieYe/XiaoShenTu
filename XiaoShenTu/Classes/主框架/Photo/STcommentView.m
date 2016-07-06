//
//  STcommentView.m
//  XiaoShenTu
//
//  Created by a on 16/7/6.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STcommentView.h"
#import "Masonry.h"
@interface STcommentView()
@property (nonatomic, weak) UIButton *praiseBtn;
@property (nonatomic, weak) UIButton *hongbaoBtn;
@property (nonatomic, weak) UILabel  *hongBaoLab;
@end

@implementation STcommentView



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
    
    UIButton *praiseBtn = [[UIButton alloc]init];
    
    //    [ImgBtn setBackgroundColor:[UIColor orangeColor]];
    [praiseBtn setImage:[UIImage imageNamed:@"pic"] forState:UIControlStateNormal];
    self.praiseBtn = praiseBtn;
    [self addSubview:praiseBtn];
}
-(void)layoutSubviews{
    
    [self.praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(XScaleWidth(KInterval10));
        make.centerY.equalTo(self.mas_centerY);
        make.width.mas_equalTo(XScaleWidth(KHeadW38));
        make.height.mas_equalTo(XScaleWidth(KHeadW38));
        //
    }];
}
@end
