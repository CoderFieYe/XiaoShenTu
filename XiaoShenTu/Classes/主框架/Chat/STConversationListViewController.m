//
//  STConversationListViewController.m
//  XiaoShenTu
//
//  Created by 张云飞 on 16/7/5.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STConversationListViewController.h"
#import "STConversationViewController.h"
#import <RongIMKit/RongIMKit.h>
@interface STConversationListViewController ()

@end

@implementation STConversationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDisplayConversationTypes:@[
                                        @(ConversationType_PRIVATE)
                                        ]];
}
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    STConversationViewController *RCConversationVC = [[STConversationViewController alloc]init];
    RCConversationVC.conversationType = model.conversationType;
    RCConversationVC.targetId = @"2301";
    RCConversationVC.title = @"自问自答";
    [self.navigationController pushViewController:RCConversationVC animated:YES];
}


@end
