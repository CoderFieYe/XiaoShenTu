//
//  STConversationViewController.m
//  XiaoShenTu
//
//  Created by 张云飞 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STConversationViewController.h"

@interface STConversationViewController ()

@end

@implementation STConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"navigationButtonReturn" highImage:@"navigationButtonReturnClick" target:self action:@selector(back)];
}
- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
