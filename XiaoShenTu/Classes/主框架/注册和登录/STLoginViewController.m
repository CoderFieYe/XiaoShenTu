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
    
    NSLog(@"登录按钮点击 666 %@, %@", self.PhoenNum.text, self.mimaField.text);
 
    
    if (![HP_NString checkMobileString:_PhoenNum.text] && [_PhoenNum.text length] != 11){
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"手机号码不正确!"  preferredStyle:UIAlertControllerStyleAlert];
    
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];

    }
    
    
    if ([_mimaField.text length] == 0) {
        //        [MobClick event:@"passwordSetting_pw_isNul"];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"密码不能为空!"   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
    if (_mimaField.text.length < 6) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"密码少于6位" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }

    NSRange range = [_mimaField.text rangeOfString:@" "];
    if (range.location != NSNotFound) {
 //        [MobClick event:@"passwordSetting_pw_isNul"];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"密码中不可包含空格!"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
        
    }
    
    
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //触摸收起键盘
    [self.view endEditing:YES];
    int curY = 64.0f;
    if (XScreenH == 480&&is_ios6) {
        curY = 0.0f;
    }
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, curY, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    
    
}




@end
