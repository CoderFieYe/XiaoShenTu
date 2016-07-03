//
//  STNavigationController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/27.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STNavigationController.h"

@interface STNavigationController ()

@end

@implementation STNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIBarButtonItem *barBtn2 = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"个人中心@2x"] style:UIBarButtonItemStylePlain target:self action:@selector(headBtnClicked)];
    self.navigationItem.leftBarButtonItem=barBtn2;

//    1.统一设置导航栏的背景
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackground"] forBarMetrics:UIBarMetricsDefault];
}

-(void)headBtnClicked{

    NSLog(@"个人头像按钮被点击");

}
//此方法 在当前的类第一次被加载到系统中的时候被调用一次  以后都不会被调用
+(void)initialize{
    NSLog(@"导航控制器类被加载");
//    1.外观代理对象 决定了导航条的外观[显示效果]
//    将来应用内的所有的导航条的外观都是一样的 其他的控件也是类似 [某些如果有系统的渲染效果的话可能不太好使]
//    UINavigationBar *navgationBar = [UINavigationBar appearance];
    UINavigationBar *navgationBar = [[UINavigationBar alloc]init];
    
    
//    2.设置背景图片
//    [navgationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackground"] forBarMetrics:UIBarMetricsDefault];
//    3.设置标题颜色
    [navgationBar setTitleTextAttributes:@{
                                          NSForegroundColorAttributeName : [UIColor whiteColor]
                                           
                                           }];
//    4.设置返回按钮的颜色 将来两侧的按钮的颜色也就是白色
//    [navgationBar setTintColor:[UIColor whiteColor]];
    
  
    

}
/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        button.size = CGSizeMake(70, 30);
        // 让按钮内部的所有内容左对齐
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //        [button sizeToFit];
        // 让按钮的内容往左边偏移10
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        // 修改导航栏左边的item
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
    
}

//返回操作会调用的方法
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{

    return  [super popViewControllerAnimated:animated];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
