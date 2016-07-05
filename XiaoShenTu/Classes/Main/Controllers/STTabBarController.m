//
//  STNavigationController.h
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/27.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STChatViewController.h"
#import "STFocusViewController.h"
#import "STHoneyViewController.h"
#import "STPhotoViewController.h"
#import "STWarningViewController.h"

#import "STTabBarController.h"
#import "STNavigationController.h"
#import "STTabBar.h"
@interface STTabBarController()
@property (nonatomic, weak)  STTabBar *customTabbar ;
@end
@implementation STTabBarController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    // 添加子控制器
    [self setupChildVc:[[STHoneyViewController alloc] init] title:@"宝贝" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    
    [self setupChildVc:[[STChatViewController alloc] init] title:@"微聊" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    
    [self setupChildVc:[[STPhotoViewController alloc] init] title:@"生活圈" image:@"tabBar_new_icon" selectedImage:@"tabBar_publish_click_icon"];
    
    [self setupChildVc:[[STWarningViewController alloc] init] title:@"预警" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    
    [self setupChildVc:[[STFocusViewController alloc] init] title:@"关注" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    [self setupTabbar];
    
}
- (void)setupTabbar
{
    STTabBar *tabbar = [[STTabBar alloc]init];
    tabbar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:tabbar];
    self.customTabbar = tabbar;
    
    
}
/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.navigationItem.title = title;
    if (![vc isKindOfClass:[STPhotoViewController class]]) {
        // 设置文字和图片
        
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
        

    }
        // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    STNavigationController *nav = [[STNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
@end
