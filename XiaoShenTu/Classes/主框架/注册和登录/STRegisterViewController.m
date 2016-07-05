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
@property (nonatomic, weak) JKCountDownButton *yanzBtn;

@end

@implementation STRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self  setNavgationBar];
    
    STRegister *view = [[STRegister alloc]initWithFrame:CGRectMake(0, 0, XScreenW, self.view.height)];
    self.yanzBtn = view.yanzBtn;
    
    [self.view addSubview:view];
    
    [self buildCountDown];
}

//  60秒倒计时
-(void)buildCountDown{

    [_yanzBtn countDownButtonHandler:^(JKCountDownButton*sender, NSInteger tag) {
        sender.enabled = NO;
        
        [sender startCountDownWithSecond:60];
        
        [sender countDownChanging:^NSString *(JKCountDownButton *countDownButton,NSUInteger second) {
            NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
            return title;
        }];
        [sender countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
            countDownButton.enabled = YES;
            return @"点击重新获取";
            
        }];
        
    }];


}

-(void)setNavgationBar{
    
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,50,30)];
    [leftButton setImage:[UIImage imageNamed:@"fanhui"]forState:UIControlStateNormal];
    [leftButton setTitle:@" 返回" forState:UIControlStateNormal];
    
    leftButton.adjustsImageWhenHighlighted = NO;
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem= leftItem;
    
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style: UIBarButtonItemStylePlain target:self action:@selector(zhuce)];
    rightBarItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

- (void)leftButtonClick {
   
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)zhuce{

   [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
