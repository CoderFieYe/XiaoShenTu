//
//  STLoginView.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STLoginView.h"


#import "UILabel+Utility.h"
#import "UIButton+Utility.h"
#import "Masonry.h"

@interface STLoginView ()


@property (nonatomic, weak) UILabel *label;

@property (nonatomic, weak) UIView *view1;
@property (nonatomic, weak) UIView *view2;
@property (nonatomic, weak) UIView *view3;
@property (nonatomic, weak) UIImageView *headImg;
@property (nonatomic, weak) UIImageView *passImg;


@end
@implementation STLoginView


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
[self setupUI];
    
    return self;

}

-(void)setupUI{
    
    UILabel *label = [UILabel labelWithTitle:@"登 录" font:[UIFont systemFontOfSize:XScaleWidth(40)] textColor:[UIColor colorWithHexString:@"#666666"] backgroundColor:nil Frame:CGRectZero];
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
    
    UIImageView *headImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"admin"]];
    self.headImg = headImg;
    [self addSubview:headImg];
    
    
    UIImageView *passImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"pass"]];
    self.passImg = passImg;
    
    [self addSubview:passImg];
    
#pragma mark -- 手机号输入
    UITextField *phoneNum  = [[UITextField alloc]init];
    phoneNum.placeholder = @"手机号";
    self.PhoenNum = phoneNum;
    self.PhoenNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.PhoenNum.delegate = self;
    self.PhoenNum.keyboardType = UIKeyboardTypeDecimalPad;
    
    [self addSubview:phoneNum];
    

    
    
    UITextField *mimaField  = [[UITextField alloc]init];
    mimaField.placeholder = @"密码";
    self.mimaField = mimaField;
    self.mimaField.secureTextEntry = YES;
//    self.mimaField.delegate = self;
    [self addSubview:mimaField];
    
    
    
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setImage:[UIImage imageNamed:@"denglu"] forState:UIControlStateNormal];

    self.loginBtn = loginBtn;
    [self addSubview:loginBtn];
    
    
    UIButton *messageBtn = [[UIButton alloc]init];
//    messageBtn.backgroundColor = XRandomColor;
    [messageBtn setTitle:@"短信验证" forState: UIControlStateNormal];
    [messageBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    messageBtn.titleLabel.font = [UIFont systemFontOfSize:XScaleWidth(18)];
     [messageBtn addTarget:self action:@selector(messageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.messageBtn = messageBtn;
    [self addSubview:messageBtn];
    
    UIButton *forgetBtn = [[UIButton alloc]init];
//     forgetBtn.backgroundColor = XRandomColor;
    [forgetBtn setTitle:@"忘记密码" forState: UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:XScaleWidth(18)];
     [forgetBtn addTarget:self action:@selector(forgetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.forgetBtn = forgetBtn;
    [self addSubview:forgetBtn];

 
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
        make.height.mas_equalTo(XScaleHeight(85));
        
    }];
    
    [self.mimaField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.PhoenNum.mas_bottom).mas_offset(XScaleHeight(2));
        make.left.mas_equalTo(self.mas_left).mas_offset(XScaleWidth(80));
        make.width.mas_equalTo(XScreenH);
        make.height.mas_equalTo(XScaleHeight(85));
        
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.mas_top).mas_equalTo(XScaleHeight(510));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(40));
        make.width.mas_equalTo(XScaleWidth(670));
        make.height.mas_equalTo(XScaleHeight(84));
    }];
    
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_equalTo(XScaleHeight(25));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(40));
        make.width.mas_equalTo(XScaleWidth(120));
        make.height.mas_equalTo(XScaleHeight(44));
    }];
    
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_equalTo(XScaleHeight(25));
        make.right.mas_equalTo(self.mas_right).mas_equalTo(XScaleWidth(-40));
        make.width.mas_equalTo(XScaleWidth(120));
        make.height.mas_equalTo(XScaleHeight(44));
    }];
    
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.PhoenNum.mas_top).mas_offset(XScaleHeight(2));
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(XScreenW);
        make.height.mas_equalTo(XScaleHeight(2));
        
    }];
    
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view1.mas_bottom).mas_equalTo(XScaleHeight(25));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(34));
        make.width.mas_equalTo(XScaleWidth(30));
        make.height.mas_equalTo(XScaleHeight(35));
        
    }];
    [self.passImg mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.view2.mas_bottom).mas_equalTo(XScaleHeight(25));
        make.left.mas_equalTo(self.mas_left).mas_equalTo(XScaleWidth(34));
        make.width.mas_equalTo(XScaleWidth(30));
        make.height.mas_equalTo(XScaleHeight(35));
        
    }];
 
 
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.PhoenNum.mas_bottom).mas_offset(XScaleHeight(2));
        make.centerX.equalTo(self.mas_centerX);
        
        make.width.mas_equalTo(XScreenW);
        make.height.mas_equalTo(XScaleHeight(2));
       
    }];
    [self.view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.mimaField.mas_bottom).mas_offset(XScaleHeight(2));
        make.centerX.equalTo(self.mas_centerX);
        make.width.mas_equalTo(XScreenW);
        make.height.mas_equalTo(XScaleHeight(2));
    }];
}





-(void)messageBtnClick{

    NSLog(@"短信验证");

}

-(void)forgetBtnClick{

    NSLog(@"忘记密码");

    
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
//      如果string为空，表示删除
        if (string.length > 0) {
            text = [NSString stringWithFormat:@"%@%@",textField.text,string];
            NSLog(@"输入框输入的内容  %@",text);
            
        }else{
            text = [textField.text substringToIndex:range.location];
        }
        
       }
 
    //密码限制(长度16)
    if (textField == self.mimaField) {
        if (self.mimaField.text.length > 15 && string.length > 0) {
            return NO;
        }
    }
    //账号限制
    if(textField==self.PhoenNum)
    {
        if (self.PhoenNum.text.length > 10 && string.length > 0) {
            return NO;
        }
        if ([string isEqualToString:@""]) {
            self.mimaField.text = nil;
        }
    }
    return YES;
}



@end
