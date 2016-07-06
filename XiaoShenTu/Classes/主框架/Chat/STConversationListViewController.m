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
    
//    self.navigationItem.rightBarButtonItem = [UINavigationBar alloc]
    
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
}
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    STConversationViewController *RCConversationVC = [[STConversationViewController alloc]init];
    RCConversationVC.conversationType = model.conversationType;
    RCConversationVC.targetId = model.targetId;
    RCConversationVC.title = model.conversationTitle;
    [self.navigationController pushViewController:RCConversationVC animated:YES];
}


@end
