//
//  STChatViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STChatViewController.h"
#import "STConversationListViewController.h"
@implementation STChatViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *login = [[UIButton alloc]init];
    [login setTitle:@"登录" forState:UIControlStateNormal];
    login.frame = CGRectMake(100, 100, 100, 100);
    [login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login];
}
- (void)login
{
    
    
    
    STConversationListViewController *conversationVC = [[STConversationListViewController alloc]init];
    [self.navigationController pushViewController:conversationVC animated:YES];
}
@end
