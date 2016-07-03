//
//  STWarningViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "STWarningViewController.h"
#import <MAMapKit/MAMapKit.h>


#import "STHInfomationView.h"

@interface STWarningViewController ()<MAMapViewDelegate>
{
    MAMapView *_mapView;
}

@end

@implementation STWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor = [UIColor whiteColor];
    
   
    
#pragma 地图展示
//    //配置用户Key
//    [MAMapServices sharedServices].apiKey = KGaoDeKey;
//    
//    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
//    _mapView.delegate = self;
//    
//    [self.view addSubview:_mapView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
