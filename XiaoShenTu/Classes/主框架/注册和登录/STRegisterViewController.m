//
//  STRegisterViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STRegisterViewController.h"
#import "STRegister.h"

@interface STRegisterViewController ()

@end

@implementation STRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self  setNavgationBar];
    
    STRegister *view = [[STRegister alloc]initWithFrame:CGRectMake(0, 0, XScreenW, self.view.height)];
    
    [self.view addSubview:view];
    
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
