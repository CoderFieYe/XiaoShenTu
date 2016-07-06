//
//  STPhotoViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STPhotoViewController.h"
#import "UIView+Extend.h"
#import "STPhoto.h"
#import "STphotoCell.h"
#import "LCBannerView.h"

@interface STPhotoViewController ()
@property (nonatomic)UIView *topView;
@property (nonatomic,strong)NSMutableArray *stArr;
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation STPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _topView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    
    self.tableView.tableHeaderView = _topView;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _scrollView.contentSize = CGSizeMake(0, [UIScreen mainScreen].bounds.size.height + 300.0f);
    [self.view addSubview:_scrollView];
    
    [self settingNavigationItem];
    [self creatUI];
}

- (void)settingNavigationItem
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"Personal" highImage:@"Personal" target:self action:@selector(person)];
    
}


-(void)creatUI{
    
    UILabel *babyLab = [[UILabel alloc] initWithFrame:CGRectMake(13, 23, 100, 16)];
    babyLab.text = @"超级宝贝秀";
    babyLab.textColor = [UIColor colorWithHexString:@"#83817d"];
    babyLab.font = [UIFont systemFontOfSize:16];
    [_topView addSubview:babyLab];
    
    UILabel *moneyLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-180, 30, 161, 9)];
    moneyLab.text = @"本期奖金2万元 截止评选 2016年4月1日";
    moneyLab.textColor = [UIColor colorWithHexString:@"#83847c"];
    moneyLab.font = [UIFont systemFontOfSize:9];
    [_topView addSubview:moneyLab];
    
    UIImageView *nearby = [[UIImageView alloc] initWithFrame:CGRectMake(9, babyLab.bottom+14, SCREEN_WIDTH-18, 100)];
//    
//    [_scrollView addSubview:({
//        
//        LCBannerView *bannerView = [[LCBannerView alloc] initWithFrame:CGRectMake(0, 20.0f, [UIScreen mainScreen].bounds.size.width, 200.0f)
//                                                              delegate:self
//                                                             imageName:@"banner"
//                                                                 count:3
//                                                         timerInterval:3.0f
//                                         currentPageIndicatorTintColor:[UIColor orangeColor]
//                                                pageIndicatorTintColor:[UIColor whiteColor]];
//        bannerView.pageDistance = 20.0f;
//        //        bannerView.notScrolling = YES;
//        bannerView;
//    })];
    
    
    
    [nearby setImage:[UIImage imageNamed:@"bg"]];
    [_topView addSubview:nearby];
    
    UILabel *chatLab = [[UILabel alloc] initWithFrame:CGRectMake(14, nearby.bottom+23, 64, 16)];
    chatLab.text = @"生活圈";
    chatLab.textColor = [UIColor colorWithHexString:@"#83817d"];
    chatLab.font = [UIFont systemFontOfSize:16];
    [_topView addSubview:chatLab];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(35,chatLab.bottom+24 ,SCREEN_WIDTH-70, 1)];
    [line setImage:[UIImage imageNamed:@"xian"]];
    [_topView addSubview:line];
    
}

-(NSArray *)stArr
{
    if (_stArr==nil) {
        
        NSMutableArray *arrayM =[NSMutableArray arrayWithCapacity:20];
        
        for (int i = 0; i < 20; i++) {
            
            //设置子控件数据
            STPhoto *photoModel = [[STPhoto alloc] init];
            photoModel.icon = @"touxiang";
            photoModel.nick = @"万老师";
            photoModel.forward = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
            photoModel.photo = @"bg";
            photoModel.time = @"1分钟前";
            photoModel.share = @"fenxiang";
            
            [arrayM addObject:photoModel];
            
        }
        _stArr = arrayM;
    }
    return _stArr;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
#pragma mark设置每组每行
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    STphotoCell *cell=[STphotoCell stcellWithTableView:tableView];
    
    //2.获取当前行的模型,设置cell的数据
    STPhoto *st =self.stArr[indexPath.row];
    cell.photo=st;
    
    //3.返回cell
    return cell;
}
-(void)person{

}

-(void)photo{

}



@end
