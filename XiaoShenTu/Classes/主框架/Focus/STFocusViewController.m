//
//  STFocusViewController.m
//  XiaoShenTu
//
//  Created by 😄 on 16/6/27.
//  Copyright © 2016年 万启鹏. All rights reserved.
//
// 屏幕高度
#define HEIGHT [UIScreen mainScreen].bounds.size.height
// 屏幕宽度
#define WIDTH [UIScreen mainScreen].bounds.size.width

#define kTITLEColor @"#595858"
#define KTITLESamll @"#595755"
#import "STFocusViewController.h"
#import "UIView+Extend.h"

@interface STFocusViewController ()
@property (nonatomic)UIScrollView *scrollView;
@property (nonatomic)UIImageView *searchImg;
@property (nonatomic)UITextField *textField;
@property (nonatomic)UIImageView *topImg;
@property (nonatomic)UIButton *warning;
@property (nonatomic)UIButton *suspicious;
@property (nonatomic)UIButton *periphery;
@property (nonatomic)UIButton *lostChild;
@property (nonatomic)UIButton *suspiciousChild;

@end

@implementation STFocusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    [self settingNavigationItem];
    [self creatUI];
//    self.scrollView.scrollEnabled = NO;
    
}
- (void)settingNavigationItem
{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"Personal" highImage:@"Personal" target:self action:@selector(friendsearch)];
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"tabBar_essence_icon" highImage:@"tabBar_essence_icon" target:self action:@selector(pop)];
}

/**
 *  设置标题按钮
 */
-(void)creatUI{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
    
    //登录的背景图片
    self.topImg = [[UIImageView alloc]initWithFrame:CGRectMake(0,0 , self.view.width,268)];
    self.topImg.userInteractionEnabled = YES;
    self.topImg.image = [UIImage imageNamed:@"pic"];
    [_scrollView addSubview:self.topImg];
    
    _searchImg = [[UIImageView alloc] initWithFrame:CGRectMake(23, _topImg.bottom+11, WIDTH-46, 25)];
    [_searchImg setImage:[UIImage imageNamed:@"fra"]];
    [_scrollView addSubview:_searchImg];

    // 4.设置所搜图标
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(28, _topImg.bottom+11, WIDTH-46, 25)];
    [_scrollView addSubview:_textField];
    
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    _textField.leftView= icon;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    
    UILabel *num1 = [[UILabel alloc] initWithFrame:CGRectMake(23, _searchImg.bottom+8.5, 200, 10)];
    num1.text = @"周边预警数量   最新预警消息";
    num1.font = [UIFont systemFontOfSize:10];
    num1.textColor = [UIColor colorWithHexString:@"999999"];
    [_scrollView addSubview:num1];
    
#pragma mark -- center
    UIView *centerView = [[[NSBundle mainBundle]loadNibNamed:@"FocusCenterView" owner:nil options:nil]lastObject];
    
    centerView.frame = CGRectMake(0, num1.bottom + 20, XScreenW, 60);
//    centerView.y = num1.bottom + 20;
    
    [_scrollView addSubview:centerView];
    
//    _warning = [[UIButton alloc]initWithFrame:CGRectMake(25, num1.bottom+30.5, self.view.width/320*25, self.view.width/320*25)];
//    [_warning setBackgroundImage:[UIImage imageNamed:@"My-early"] forState:UIControlStateNormal];
//    [_warning addTarget:self action:@selector(warningBtn) forControlEvents:UIControlEventTouchUpInside];
//    [_scrollView addSubview:_warning];
//    
//    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(_warning.right+5,_warning.top+4,60, 20)];
//    lab1.text = @"我的预警";
//    lab1.textColor = [UIColor colorWithHexString:kTITLEColor];
//    lab1.font = [UIFont systemFontOfSize:13];
//    lab1.textAlignment = NSTextAlignmentCenter;
//    [_scrollView addSubview:lab1];
//    
//    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(23, _warning.bottom+6,90, 9)];
//    lab.text = @"自由设定转发人的奖励";
////    lab.backgroundColor = [UIColor redColor];
//    lab.textColor = [UIColor colorWithHexString:KTITLESamll];
//    lab.font = [UIFont systemFontOfSize:9];
//    lab.textAlignment = NSTextAlignmentCenter;
//    [_scrollView addSubview:lab];
//    
 
//    _periphery = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2-12-20, num1.bottom+30.5, self.view.width/320*25, self.view.width/320*25)];
////        _periphery.backgroundColor = [UIColor redColor];
//    [_periphery setBackgroundImage:[UIImage imageNamed:@"Suspicious-child"] forState:UIControlStateNormal];
//    [_periphery addTarget:self action:@selector(peripheryBtn) forControlEvents:UIControlEventTouchUpInside];
//    [_scrollView addSubview:_periphery];
//
//    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(_periphery.right+5, _warning.top+4,80, 20)];
//    lab4.text = @"上报可疑儿童";
//    lab4.textColor = [UIColor colorWithHexString:kTITLEColor];
//    lab4.font = [UIFont systemFontOfSize:13];
//    lab4.textAlignment = NSTextAlignmentCenter;
//    [_scrollView addSubview:lab4];
//
//    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2-65, _warning.bottom+6,90, 9)];
//    lab5.text = @"上报一个奖励10元";
//    lab5.textColor = [UIColor colorWithHexString:KTITLESamll];
//    lab5.font = [UIFont systemFontOfSize:9];
//    lab5.textAlignment = NSTextAlignmentCenter;
//    [_scrollView addSubview:lab5];
    
    
//    _suspicious = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-52-15-35, num1.bottom+30.5,self.view.width/320*25, self.view.width/320*25)];
//    [_suspicious setBackgroundImage:[UIImage imageNamed:@"Perimeter"] forState:UIControlStateNormal];
//    [_suspicious addTarget:self action:@selector(suspiciousBtn) forControlEvents:UIControlEventTouchUpInside];
//    [_scrollView addSubview:_suspicious];
//    
//    
//    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-52-15, _warning.top+4,52, 20)];
//    lab2.text = @"周边预警";
//    lab2.textColor = [UIColor colorWithHexString:kTITLEColor];
//    lab2.font = [UIFont systemFontOfSize:13];
//    lab2.textAlignment = NSTextAlignmentCenter;
//    [_scrollView addSubview:lab2];
//    
//    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(_suspicious.left, _warning.bottom+6,70, 9)];
//    lab3.text = @"寻找儿童有悬赏";
//    lab3.textColor = [UIColor colorWithHexString:KTITLESamll];
//    lab3.font = [UIFont systemFontOfSize:9];
//    lab3.textAlignment = NSTextAlignmentCenter;
//    [_scrollView addSubview:lab3];
//
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0,centerView.bottom+10,WIDTH,1)];
    line.backgroundColor = [UIColor colorWithHexString:@"#dfe0dd"];
    [_scrollView addSubview:line];
    
    
    _lostChild = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH/4-22, line.bottom+26, self.view.width/320*44, self.view.width/320*44)];
    
    [self.view addSubview:_lostChild];
    [_lostChild setBackgroundImage:[UIImage imageNamed:@"Lost-children"] forState:UIControlStateNormal];
    [_lostChild addTarget:self action:@selector(peripheryBtn) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_lostChild];
    
    UILabel *lab6= [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/4-59 , _lostChild.bottom+18,118, 13)];
    lab6.text = @"中国儿童走失数据库";
    lab6.textColor = [UIColor colorWithHexString:kTITLEColor];
    lab6.font = [UIFont systemFontOfSize:13];
    lab6.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:lab6];
    
    UILabel *lab7 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/4-50, lab6.bottom+6,100, 20)];
    lab7.text = @"转发分享信息可得输入";
    lab7.textColor = [UIColor colorWithHexString:kTITLEColor];
    lab7.font = [UIFont systemFontOfSize:8];
    lab7.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:lab7];
    
    
//    UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH-WIDTH/3, line.bottom+30, self.view.width/320*44, self.view.width/320*44)];
//    img2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:img2];
//   
//
    _suspiciousChild = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-WIDTH/3, line.bottom+26, self.view.width/320*44, self.view.width/320*44)];
    
    [self.view addSubview:_suspiciousChild];
    [_suspiciousChild setBackgroundImage:[UIImage imageNamed:@"Child-data"] forState:UIControlStateNormal];
    [_suspiciousChild addTarget:self action:@selector(peripheryBtn) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:_suspiciousChild];
    
    UILabel *lab8= [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-WIDTH/4-59 , _suspiciousChild.bottom+18,118, 13)];
    lab8.text = @"中国可疑儿童数据库";
    lab8.textColor = [UIColor colorWithHexString:kTITLEColor];
    lab8.font = [UIFont systemFontOfSize:13];
    lab8.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:lab8];
    
    UILabel *lab9 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-WIDTH/4-40, lab8.bottom+6,80, 20)];
    lab9.text = @"转发分享信息可得输入";
    lab9.textColor = [UIColor colorWithHexString:kTITLEColor];
    lab9.font = [UIFont systemFontOfSize:8];
    lab9.textAlignment = NSTextAlignmentCenter;
    [_scrollView addSubview:lab9];
    
    _scrollView.contentSize = CGSizeMake(0, HEIGHT-63);
    [self.view addSubview:_scrollView];
    
}
-(void)warningBtn{
    NSLog(@"");
}
-(void)suspiciousBtn{

}
- (void)friendsearch
{
    NSLog(@"friendsearch");
}
-(void)peripheryBtn{

}
- (void)pop
{
    NSLog(@"pop");
}
@end
