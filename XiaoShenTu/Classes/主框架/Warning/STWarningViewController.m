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



     self.view.backgroundColor = [UIColor whiteColor];

# pragma  mark --   地图展示
    //配置用户Key
    [MAMapServices sharedServices].apiKey = KGaoDeKey;
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];
    

    //       创建  随机天使 😇😇😇😇😇😇

    [self setAngels];
//  开启定位
//    _mapView.showsUserLocation = YES;    //YES 为打开定位，NO为关闭定位
    
    
//    后台定位
//    _mapView.pausesLocationUpdatesAutomatically = NO;
//    
//    _mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
    
    [self setupView];
    
}

-(void)setupView{
    
  

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    [_mapView setZoomLevel:12.11 animated:YES];

    
}

-(void)setAngels{

    //     大头针标注
    
    for (int i = 0 ; i < 88; i++) {
        
        
        //      产生 ±1 的随机数
        int a = arc4random()%3 - 1;
        
        while (a== 0) {
            a = arc4random()%3 - 1;
        }
        NSLog(@" a  =====   %d",a);
        
        
        //       创建  随机天使 😇😇😇😇😇😇
        CGFloat  locX = 39.989631 + (arc4random_uniform(80) * 0.001) * a;
        CGFloat  locY =  116.42119 + (arc4random_uniform(100) * 0.001) * a;
        
        CLLocationCoordinate2D  Coordinate = CLLocationCoordinate2DMake(locX, locY);
        
        
        
        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
        pointAnnotation.coordinate = Coordinate;
        [_mapView addAnnotation:pointAnnotation];
        
    }


}
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MAAnnotationView *view = views[0];
    
    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
        pre.image = [UIImage imageNamed:@"location.png"];
        pre.lineWidth = 3;
        pre.lineDashPattern = @[@6, @3];
        
        [_mapView updateUserLocationRepresentation:pre];
        
        view.calloutOffset = CGPointMake(0, 0);
    } 
}



//当位置更新时，会进定位回调，通过回调函数，能获取到定位点的经纬度坐标
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        
//        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}


//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *pointReuseIndentifier = @"dingwei";
//        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
//        return annotationView;
//    }
//    return nil;
//}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"dingwei";
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:reuseIndetifier];
        }
        annotationView.image = [UIImage imageNamed:@"dingwei"];
        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
