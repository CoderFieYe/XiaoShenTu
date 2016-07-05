//
//  STRegister.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STRegister.h"
#import "JKCountDownButton.h"

#import "UILabel+Utility.h"
#import "UIButton+Utility.h"
#import "Masonry.h"

@interface STRegister ()

@property (nonatomic, weak) UILabel *label;

@property (nonatomic, weak) UIView *view1;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, weak) UIView *view3;
@property (nonatomic, weak) UIView *view4;

@property (nonatomic, weak) UIImageView *PhoenImg;
@property (nonatomic, weak) UIImageView *yanzhengImg;
@property (nonatomic, weak) UIImageView *mimaImg;

@property (nonatomic, weak) UITextField *PhoenNum;
@property (nonatomic, weak) UITextField *yanzhengNum;
@property (nonatomic, weak) UITextField *mimaField;

//@property (nonatomic, weak) JKCountDownButton *yanzBtn;



@property (nonatomic, weak) UIButton *loginBtn;



@end
@implementation STRegister

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    [self setupUI];
    
    return self;
}

-(void)setupUI{
    
    UILabel *label = [UILabel labelWithTitle:@"注 册" font:[UIFont systemFontOfSize:XScaleWidth(40)] textColor:[UIColor colorWithHexString:@"#666666"] backgroundColor:nil Frame:CGRectZero];
    self.label = label;
    [self addSubview:label];
    
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor colorWithHexString:@"#d9d9d9"];
    self.view1 = view1;
    [self addSubview:view1];
    
    UIView *view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor colorWithHexString:@"#d9d9d9"];
    self.view2 = view2;
    [self addSubview:view2];
    
    UIView *view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor colorWithHexString:@"#d9d9d9"];
    self.view3 = view3;
    [self addSubview:view3];
    
    UIView *view4 = [[UIView alloc]init];
    view4.backgroundColor = [UIColor colorWithHexString:@"#d9d9d9"];
    self.view4 = view4;
    [self addSubview:view4];
    
    UIImageView *PhoenImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tel"]];
    self.PhoenImg = PhoenImg;
    [self addSubview:PhoenImg];
    
    
    UIImageView *yanzheng = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yanzheng"]];
    self.yanzhengImg = yanzheng;
    [self addSubview:yanzheng];
    
    
    UIImageView *mimaImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mima"]];
    self.mimaImg = mimaImg;
    [self addSubview:mimaImg];
    
    UITextField *phoneNum  = [[UITextField alloc]init];
    phoneNum.placeholder = @"手机号";
    self.PhoenNum = phoneNum;
    self.PhoenNum.delegate = self;
    self.PhoenNum.keyboardType = UIKeyboardTypeDecimalPad;
    [self addSubview:phoneNum];
    
    
    UITextField *yanzhengNum  = [[UITextField alloc]init];
    yanzhengNum.placeholder = @"手机验证码";
    self.yanzhengNum = yanzhengNum;
    self.yanzhengNum.delegate = self;
    self.yanzhengNum.keyboardType = UIKeyboardTypeDecimalPad;
    [self addSubview:yanzhengNum];
    
    
    UITextField *mimaField  = [[UITextField alloc]init];
    mimaField.placeholder = @"请输入密码";
    //    mimaField.leftView = (UIView *)self.mimaImg;
    //    mimaField.leftViewMode = UITextFieldViewModeAlways;
    self.mimaField = mimaField;
    [self addSubview:mimaField];
    
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setImage:[UIImage imageNamed:@"zhuce"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.loginBtn = loginBtn;
    [self addSubview:loginBtn];
    
    
    
#pragma  mark ---  验证码 按钮
    JKCountDownButton *yanzBtn = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
    yanzBtn.backgroundColor = [UIColor orangeColor];
    yanzBtn.layer.cornerRadius = 6;
    yanzBtn.clipsToBounds = YES;
    [yanzBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [yanzBtn addTarget:self action:@selector(yanzBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.yanzBtn = yanzBtn;
    [self addSubview:yanzBtn];
    
    
}
-(void)layoutSubviews{
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(XScaleHeight(42));
        make.centerX.equalTo(self.mas_centerX);
        
    }];
    
    
    [self.PhoenNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.label.mas_bottom).mas_offset(XScaleHeight(52));
        make.left.mas_equalTo(self.mas_left).mas_offset(XScaleWidth(80));
        make.width.mas_equalTo(XScreenH);
        make.height.mas_equalTo(XScaleHeight(86));
        
    }];
    
    [self.yanzhengNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.PhoenNum.mas_bottom).mas_offset(XScaleHeight(2));
        make.left.mas_equalTo(self.mas_left).mas_offset(XScaleWidth(80));
        make.width.mas_equalTo(XScreenH);
        make.height.mas_equalTo(XScaleHeight(86));
        
    }];
    
    [self.mimaField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yanzhengNum.mas_bottom).mas_offset(XScaleHeight(2));
        make.left.mas_equalTo(self.mas_left).mas_offset(XScaleWidth(80));
        make.width.mas_equalTo(XScreenH);
        make.height.mas_equalTo(XScaleHeight(86));
        
    }];
    
    
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mas_top).mas_equalTo(XScaleHeight(510));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(40));
        make.width.mas_equalTo(XScaleWidth(670));
        make.height.mas_equalTo(XScaleHeight(84));
        
    }];


    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.PhoenNum.mas_top).mas_offset(XScaleHeight(2));
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(XScreenW);
        make.height.mas_equalTo(XScaleHeight(2));
        
    }];
    
    
    [self.PhoenImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view1.mas_bottom).mas_equalTo(XScaleHeight(25));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(28));
        make.width.mas_equalTo(XScaleWidth(30));
        make.height.mas_equalTo(XScaleHeight(35));
        
    }];
    
        [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
    
            make.top.mas_equalTo(self.PhoenNum.mas_bottom).mas_offset(XScaleHeight(2));
            make.centerX.equalTo(self.mas_centerX);
    
            make.width.mas_equalTo(XScreenW);
            make.height.mas_equalTo(XScaleHeight(2));
            
        }];
    [self.yanzBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.view2.mas_bottom).mas_offset(XScaleHeight(8));
        make.right.mas_equalTo(self.mas_right).mas_offset(XScaleWidth(-30));
        make.width.mas_equalTo(XScaleWidth(254));
        make.height.mas_equalTo(XScaleHeight(70));
   
        
    }];

    
    [self.yanzhengImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view2.mas_bottom).mas_equalTo(XScaleHeight(25));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(28));
        make.width.mas_equalTo(XScaleWidth(30));
        make.height.mas_equalTo(XScaleHeight(35));
        
    }];
    
    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yanzhengNum.mas_bottom).mas_offset(XScaleHeight(2));
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(XScreenW);
        make.height.mas_equalTo(XScaleHeight(2));
        
    }];

    [self.mimaImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.view3.mas_bottom).mas_equalTo(XScaleHeight(25));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(28));
        make.width.mas_equalTo(XScaleWidth(30));
        make.height.mas_equalTo(XScaleHeight(35));
        
    }];
    
    [self.view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mimaField.mas_bottom).mas_offset(XScaleHeight(2));
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(XScreenW);
        make.height.mas_equalTo(XScaleHeight(2));
    }];
    

    
}


-(void)loginBtnClick{
    
    NSLog(@"注册");
    
}

-(void)yanzBtnClick{
    
    NSLog(@"短信验证");
    
}


#pragma mark ------------------------UITextFieldDelegate---------------------------


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField==self.PhoenNum) {
        NSInteger strLength = textField.text.length - range.length + string.length;
        if (strLength > 11){
            return NO;
        }
        NSString *text = nil;
        //如果string为空，表示删除
        if (string.length > 0) {
            text = [NSString stringWithFormat:@"%@%@",textField.text,string];
        }else{
            text = [textField.text substringToIndex:range.location];
        }
        //        if ([self isMobile:text]) {
        //            [btnVeriy setEnabled:YES];
        //        }else{
        //            [btnVeriy setEnabled:NO];
        //        }
    }
    return YES;
}

@end
