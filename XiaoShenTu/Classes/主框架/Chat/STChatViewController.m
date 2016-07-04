//
//  STChatViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STChatViewController.h"
#import "STchat.h"
#import "STchatCell.h"
#import "UIView+Extend.h"
@interface STChatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic)UIView *topView;
@property (nonatomic,strong)NSMutableArray *stArr;
@end

@implementation STChatViewController

- (void)viewDidLoad {

    [super viewDidLoad];
     _topView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    
    self.tableView.tableHeaderView = _topView;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self settingNavigationItem];
    [self creatUI];

}


- (void)settingNavigationItem
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"Personal" highImage:@"Personal" target:self action:@selector(friendsearch)];
        self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"tabBar_essence_icon" highImage:@"tabBar_essence_icon" target:self action:@selector(pop)];
}


-(void)creatUI{
 
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(13, 23, 100, 16)];
    lab.text = @"公益活动";
    lab.textColor = [UIColor colorWithHexString:@"#83817d"];
    [_topView addSubview:lab];
    
    UIImageView *nearby = [[UIImageView alloc] initWithFrame:CGRectMake(9, lab.bottom+14, SCREEN_WIDTH-18, 100)];
    [nearby setImage:[UIImage imageNamed:@"pic"]];
    [_topView addSubview:nearby];
    
    UILabel *chatLab = [[UILabel alloc] initWithFrame:CGRectMake(14, nearby.bottom+23, 34, 16)];
    chatLab.text = @"微聊";
    chatLab.textColor = [UIColor colorWithHexString:@"#83817d"];
    [_topView addSubview:chatLab];
    
    UILabel *messageLab = [[UILabel alloc] initWithFrame:CGRectMake(chatLab.right+2, nearby.bottom+25, 100, 12)];
    messageLab.text = @"(你有2条消息)";
    messageLab.textColor = [UIColor colorWithHexString:@"#83817d"];
    messageLab.font = [UIFont systemFontOfSize:12];
    [_topView addSubview:messageLab];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(35,chatLab.bottom+24 ,SCREEN_WIDTH-70, 1)];
    [line setImage:[UIImage imageNamed:@"xian"]];
    [_topView addSubview:line];
    
    
 
    
    [self.tableView reloadData];
}
-(NSArray *)stArr
{
        if (_stArr==nil) {

        NSMutableArray *arrayM =[NSMutableArray arrayWithCapacity:20];
            
            for (int i = 0; i < 20; i++) {
                
                //设置子控件数据
                STchat *chatModel = [[STchat alloc] init];
                chatModel.icon = @"dsadas";
                chatModel.name = @"董强";
                chatModel.content = @"恢复和收费空间换地方666";
                chatModel.time = @"12:00";
                
                [arrayM addObject:chatModel];
                
            }
            _stArr = arrayM;
        }
    return _stArr;

}

//多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
 #pragma mark设置每组每行
 -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
        //1.创建cell
       STchatCell *cell=[STchatCell stcellWithTableView:tableView];
    
        //2.获取当前行的模型,设置cell的数据
         STchat *st =self.stArr[indexPath.row];
         cell.chat=st;
    
        //3.返回cell
        return cell;
     }

- (void)friendsearch{

}

- (void)pop{

}

@end
