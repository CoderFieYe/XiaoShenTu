//
//  STLoginViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STLoginViewController.h"
#import "STLoginView.h"
#import "STRegisterViewController.h"

@interface STLoginViewController ()

@property (nonatomic, weak) UITextField *PhoenNum;
@property (nonatomic, weak) UITextField *mimaField;

@property (nonatomic, weak) UIButton *loginBtn;
@property (nonatomic, weak) UIButton *messageBtn;
@property (nonatomic, weak) UIButton *forgetBtn;

@end

@implementation STLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
  
    STLoginView *LoginView  = [[STLoginView alloc]initWithFrame:CGRectMake(0, 0, XScreenW,self.view.height)];
    self.PhoenNum = LoginView.PhoenNum;
    self.mimaField = LoginView.mimaField;
    
    
    self.loginBtn = LoginView.loginBtn;
    [self.view addSubview:LoginView];
    
    [self  setNavgationBar];
    
    
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)setNavgationBar{
    
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,50,30)];
    [leftButton setImage:[UIImage imageNamed:@"fanhui"]forState:UIControlStateNormal];
    [leftButton setTitle:@" 返回" forState:UIControlStateNormal];
    
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style: UIBarButtonItemStylePlain target:self action:@selector(zhuceBarItemClick)];
    rightBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

- (void)leftButtonClick {

    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)zhuceBarItemClick{

    STRegisterViewController *registerVc = [[STRegisterViewController alloc]init];
    [self.navigationController pushViewController:registerVc animated:YES];

}



-(void)loginBtnClick{
    
    NSLog(@"登录666");
 
    
    if (![HP_NString checkMobileString:_PhoenNum.text] && [_PhoenNum.text length] != 11){
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"手机号码不正确!"  preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];

    }
    
}



@end
