//
//  STRegisterViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STRegisterViewController.h"
#import "STRegister.h"

#import "JKCountDownButton.h"

@interface STRegisterViewController ()

@property (nonatomic, weak) UITextField *PhoenNum;
@property (nonatomic, weak) UITextField *yanzhengNum;
@property (nonatomic, weak) UITextField *mimaField;


@property (nonatomic, weak) JKCountDownButton *yanzBtn;
@property (nonatomic, weak) UIButton *registerBtn;


@end

@implementation STRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self  setNavgationBar];
    
    STRegister *RigisterView = [[STRegister alloc]initWithFrame:CGRectMake(0, 0, XScreenW, self.view.height)];
    self.PhoenNum = RigisterView.PhoenNum;

    self.yanzBtn = RigisterView.yanzBtn;
    self.registerBtn = RigisterView.registerBtn;
    
    [self.view addSubview:RigisterView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buildCountDown) name:@"HuoQuYanZhengMa" object:nil];
    
    [self.yanzBtn addTarget:self action:@selector(huoquyanzhengmaButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];

}


//  60秒倒计时
-(void)buildCountDown{
    self.yanzBtn.enabled = NO;
    [self.yanzBtn startCountDownWithSecond:60];
    [self.yanzBtn countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
        NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
        return title;
    }];

    [self.yanzBtn countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
                    countDownButton.enabled = YES;
                    return @"点击重新获取";
        
         }];
//    曾经的实现方法
    //    NSLog(@"按钮 倒计时...");
    //    [_yanzBtn countDownButtonHandler:^(JKCountDownButton *sender, NSInteger tag) {
    //        sender.enabled = NO;
    //
    //        [sender startCountDownWithSecond:60];
    //
    //        [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
    //            NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
    //            return title;
    //        }];
    //        [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
    //            countDownButton.enabled = YES;
    //            return @"点击重新获取";
    //            
    //        }];

}

-(void)setNavgationBar{
    
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,50,30)];
    [leftButton setImage:[UIImage imageNamed:@"fanhui"]forState:UIControlStateNormal];
    [leftButton setTitle:@" 返回" forState:UIControlStateNormal];
    
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style: UIBarButtonItemStylePlain target:self action:@selector(zhuceBarItemClick)];
    rightBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

- (void)leftButtonClick {
   
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)zhuceBarItemClick{

   [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- 按钮的点击方法
-(void)registerBtnClick{
    
    NSLog(@"注册");
    
}

-(void)huoquyanzhengmaButtonClick:(UIButton *)button{
    
    NSLog(@"获取验证码");
    //    button.enabled=NO;//避免多次点击
    
    if ([HP_NString checkMobileString:_PhoenNum.text] && [_PhoenNum.text length] == 11) {
        
        NSLog(@"让按钮倒计时");
        [[NSNotificationCenter defaultCenter]postNotificationName:@"HuoQuYanZhengMa" object:nil];
        
        button.enabled=YES;
        return;
        
    }
    if ([_PhoenNum.text length] == 0) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"手机号不能为空!"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        button.enabled=YES;
        return;
    }
    
    if (![HP_NString checkMobileString:_PhoenNum.text]){
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"手机号码不正确!"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        button.enabled=YES;
        return;
        
        
    }
    
    
    
    
}



@end
