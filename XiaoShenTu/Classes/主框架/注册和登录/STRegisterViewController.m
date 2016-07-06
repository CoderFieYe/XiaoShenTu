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
@property (nonatomic, weak) UITextField *mimaField2;


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
    self.yanzhengNum = RigisterView.yanzhengNum;
    self.mimaField = RigisterView.mimaField;
    self.mimaField2 = RigisterView.mimaField2;
    
    
    self.yanzBtn = RigisterView.yanzBtn;
    self.registerBtn = RigisterView.registerBtn;
    
    [self.view addSubview:RigisterView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buildCountDown) name:@"HuoQuYanZhengMa" object:nil];
    
    [self.yanzBtn addTarget:self action:@selector(huoquyanzhengmaButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.registerBtn addTarget:self action:@selector(startRegister) forControlEvents:UIControlEventTouchUpInside];

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
    
    
    NSLog(@"注册页面的信息   %@, %@ ,%@ ,%@",self.PhoenNum.text, self.yanzhengNum.text, self.mimaField.text, self.mimaField2.text);
    
    if (![self.mimaField.text isEqualToString:self.mimaField2.text]) {
//        两次密码输入不一致
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"两次密码输入不一致!"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
    
    
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


-(void)startRegister
{
    NSLog(@"完成注册按钮点击事件");
    NSLog(@"注册页面的信息   %@, %@ ,%@ ,%@",self.PhoenNum.text, self.yanzhengNum.text, self.mimaField.text, self.mimaField2.text);
    
    
    [self.view endEditing:YES];
    //    [MobClick event:@"passwordSetting_ok_BTN"];
    //    事件ID:tianxiemima_wancheng_click
    //    中文描述：填写密码_完成_点击
//    [MobClick event:@"tianxiemima_wancheng_click" label:@"填写密码_完成_点击"];
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
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"密码设置不能少于6位" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    if ([_mimaField2.text length] == 0) {
//        [MobClick event:@"passwordSetting_pw_isNul"];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"两次密码输入不一致!"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    if (_mimaField2.text.length < 6) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"密码设置不能少于6位"  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    if (![_mimaField2.text isEqualToString:_mimaField.text]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil    message:@"两次输入的密码不一致!"  preferredStyle:UIAlertControllerStyleAlert];
        
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
    
//    if (_inviteCodeField.text == nil || [_inviteCodeField isEqual:[NSNull null]]) {
//        _inviteCodeField.text = @"";
//    }
    
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    //设备名称
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    // 当前屏幕尺寸
    NSString *appCurSize = [NSString stringWithFormat:@"%f*%f",[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height];
    NSString * province_id = [self.area_id stringByReplacingCharactersInRange:NSMakeRange(2, 4) withString:@"0000"];
    NSDictionary *dict = @{@"data":@{
//                                   @"yid":kGET_YID,
                                   @"primobile":self.primobile,
//                                   @"passpwd":[self changeToXiaoxie:[[NSString stringWithFormat:@"BIYOUWOSHI%@",_mimaField.text] MD5Hash]],
                                   @"content":self.content,
                                   @"nickname":self.nickName,
                                   @"area_id":self.area_id,
                                   @"city_id":self.city_id,
                                   @"province_id":province_id,
                                   @"role":@"2",
//                                   @"invitecode":_inviteCodeField.text,
                                   @"gender":self.sex?@"F":@"M",
                                   @"system_type":@"ios",
                                   @"system_ver":phoneVersion,
//                                   @"wifi_mac":[[NSUserDefaults standardUserDefaults] objectForKey:kDEVICE_OPENUDID],
                                   @"screen":appCurSize,
                                   @"device_name":deviceName,
                                   @"channel":@"AppStore"
                                   },
                           @"fromid":@"ios",
                           @"objId":@"RegisterVO",
//                           @"yid":kGET_YID,
                           @"version":kCURRENT_VERSION
                           };
    
//    [registRequest addRequestWithUrlString:[NSString stringWithFormat:@"%@%@",kHOST_URL,kREGISTER_URL] jsonDict:dict needCache:NO isRefresh:YES name:@"registAccount"];
//    
//    
//    
//    _progressHUD = [MBProgressHUD showHUDAddedTo:kCUREENT_WINDOW animated:YES];
//    _progressHUD.delegate = self;
//    _progressHUD.labelText = @"注册中...";
//    _progressHUD.dimBackground = YES;
    
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
