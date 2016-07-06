//
//  STHoneyViewController.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/28.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "Masonry.h"

#import "STLoginViewController.h"

#import "STHeadImage.h"


#import "STHoneyViewController.h"

#import "STHInfomation.h"
#import "STHInfomationView.h"
#import "STRedAndHomeView.h"


#import "STHCollectionView.h"
#import "STHongBaoAnnotation.h"

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

#import <AMapLocationKit/AMapLocationKit.h>
//#import <AMapLocationKit/AMapLocationManager.h>

@interface STHoneyViewController () <MAMapViewDelegate, AMapLocationManagerDelegate>


@property (nonatomic, strong) STHInfomationView *detailView;

//地图
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, strong) STHInfomation *InfomationArrs;//个人信息
@property (nonatomic, strong) NSArray *allData; //数组中存放数据模型 后台信息
@property (nonatomic, strong) NSMutableArray *regions;

@property (nonatomic, strong) STHCollectionView *collectionView;


@property (nonatomic, strong) STRedAndHomeView *redAndHomeView;

@property (nonatomic, weak) UIButton *cellBtn;



@end

@implementation STHoneyViewController

static CGFloat  KHeight136  = 136;



//#define XScaleHeight(KHeadH76)   XScaleHeight(KHeadH76)
//#define XScaleHeight(KHeadW76)   XScaleHeight(KHeadW76)
//#define  XScaleHeight(kInterval20)     XScaleHeight(kInterval20)
//#define XScaleHeight(KHeight136)   XScaleHeight(KHeight136)

#define kCollectionViewH  self.mapView.height - 49 - 38 - 40



-(STHInfomation *)InfomationArrs{


    
    if (!_InfomationArrs) {


    }
    return _InfomationArrs;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
#pragma mark -- -----通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(OpenPersonDetailNoti) name:KOpenPersonDetailNoti object:nil];
    
    _mapView.showsUserLocation = YES;    //YES 为打开定位，NO为关闭定位
    
    [_mapView setUserTrackingMode: MAUserTrackingModeFollow animated:YES]; //地图跟着位置移动
    
//    持续定位
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
//    开启持续定位
//    [self.locationManager startUpdatingLocation];
    
//   停止持续定位
//    [self.locationManager stopUpdatingLocation];
    
    //    后台定位
    _mapView.pausesLocationUpdatesAutomatically = NO;
    
    _mapView.allowsBackgroundLocationUpdates = YES;//iOS9以上系统必须配置
    
    
//   单次定位
    
    // 带逆地理信息的一次定位（返回坐标和地址信息）
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];
    //   定位超时时间，最低2s，此处设置为3s
    self.locationManager.locationTimeout =3;
    //   逆地理请求超时时间，最低2s，此处设置为3s
    self.locationManager.reGeocodeTimeout = 3;
    
    // 带逆地理（返回坐标和地址信息。将下面代码中的YES改成NO，则不会返回地址信息。
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error)
        {
            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
            
//            if (error.code == AMapLocatingErrorLocateFailed)
            if (error.code == 1)
            {
                return;
            }
        }
        
        NSLog(@"location:%@", location);
        
        if (regeocode)
        {
            NSLog(@"reGeocode:%@", regeocode);
        }
    }];
    
//    围栏
//    [self configLocationManager];
    
    self.regions = [[NSMutableArray alloc] init];
    
    self.mapView.showsUserLocation = YES;

    [self setLeftNavgationBar];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
  self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
//    大头针标注
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    pointAnnotation.title = @"方恒国际111";
    pointAnnotation.subtitle = @"阜通东大街6号";
    
    [_mapView addAnnotation:pointAnnotation];
    
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Do any additional setup after loading the view, typically from a nib.
    
//      配置用户Key
    [MAMapServices sharedServices].apiKey = @"38059dad5bc19bddfa2c6c82c777c1cd";
    
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.delegate = self;
    
    [self.view addSubview:_mapView];
    
//     定位图层
    _mapView.showsUserLocation = YES;
    [_mapView setUserTrackingMode: MAUserTrackingModeFollowWithHeading animated:YES];
    
    //地图跟着位置移动   实现缩放的方法  定位无法实现缩放
    [_mapView setZoomLevel:14.1 animated:YES];


    
    
//    添加大头针  利用 for 循环
#pragma mark  -- 红包上的标注
    
    CLLocationCoordinate2D pointA =CLLocationCoordinate2DMake(39.992416, 116.43130);
    STHongBaoAnnotation *hongBaoAnnotation = [[STHongBaoAnnotation alloc] init];
    hongBaoAnnotation.coordinate = pointA;
    hongBaoAnnotation.title = @"红包";
    hongBaoAnnotation.subtitle = @"发红包";
    [_mapView addAnnotation:hongBaoAnnotation];
    
    CLLocationCoordinate2D pointB =CLLocationCoordinate2DMake(39.989631, 116.42119);
    MAPointAnnotation *pointAnnotationB = [[MAPointAnnotation alloc] init];
    pointAnnotationB.coordinate = pointB;
    pointAnnotationB.title = @"方恒国际2";
    pointAnnotationB.subtitle = @"阜通东大街6号";
    [_mapView addAnnotation:pointAnnotationB];
    
    
    
//     地理围栏
    [self getCurrentLocation];

    [self setHeadCollectionView];
    

    
//  红包和家庭  👪  按钮

  

    STRedAndHomeView *redAndHomeView = [[STRedAndHomeView alloc]initWithFrame:CGRectMake(0, self.mapView.height -  49 - XScaleHeight(235) , XScaleWidth(100), XScaleHeight(235))];
    
    self.redAndHomeView = redAndHomeView;
    [self.mapView addSubview:redAndHomeView];
    
}

// 个人中心
-(void)setLeftNavgationBar{


    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,30,30)];
    [leftButton setImage:[UIImage imageNamed:@"个人中心"]forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    leftButton.adjustsImageWhenHighlighted = NO;
    self.navigationItem.leftBarButtonItem= leftItem;
    
    self.view.backgroundColor = [UIColor whiteColor];

}

#pragma mark - Add Regions
- (void)getCurrentLocation
{
    __weak typeof(self) weakSelf = self;
    [self.locationManager requestLocationWithReGeocode:NO completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        [weakSelf addCircleReionForCoordinate:location.coordinate];
    }];
}

- (void)addCircleReionForCoordinate:(CLLocationCoordinate2D)coordinate
{
//    AMapLocationCircleRegion *cirRegion200 = [[AMapLocationCircleRegion alloc] initWithCenter:coordinate
//                                                                                       radius:200.0
//                                                                                   identifier:@"circleRegion200"];
   
//    可以设置围栏圈的大小  圆圈半径5km
    AMapLocationCircleRegion *cirRegion300 = [[AMapLocationCircleRegion alloc] initWithCenter:coordinate
                                                                                       radius:5000.0
                                                                                   identifier:@"circleRegion300"];
    
    //添加地理围栏
//    [self.locationManager startMonitoringForRegion:cirRegion200];
    [self.locationManager startMonitoringForRegion:cirRegion300];
    
    //保存地理围栏
//    [self.regions addObject:cirRegion200];
    [self.regions addObject:cirRegion300];
    
    //添加Overlay
//    MACircle *circle200 = [MACircle circleWithCenterCoordinate:coordinate radius:200.0];
    MACircle *circle300 = [MACircle circleWithCenterCoordinate:coordinate radius:5000.0];
//    [self.mapView addOverlay:circle200];
    [self.mapView addOverlay:circle300];
    
    [self.mapView setVisibleMapRect:circle300.boundingMapRect];
}


#pragma mark - MAMapViewDelegate

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    NSLog(@"添加地理围栏代理方法");
    if ([overlay isKindOfClass:[MAPolygon class]])
    {
        MAPolygonRenderer *polylineRenderer = [[MAPolygonRenderer alloc] initWithPolygon:overlay];
        polylineRenderer.lineWidth = 1.0f;
        polylineRenderer.strokeColor = [UIColor orangeColor];
        
        return polylineRenderer;
    }
    else if ([overlay isKindOfClass:[MACircle class]])
    {
        MACircleRenderer *circleRenderer = [[MACircleRenderer alloc] initWithCircle:overlay];
        circleRenderer.lineWidth = 1.0f;
        circleRenderer.strokeColor = [UIColor blueColor];
        return circleRenderer;
    }
    
        return nil;
}

#pragma mark - 大头针标注   自定义标注图标
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[STHongBaoAnnotation class]]) {
        
        static NSString *hongbaoReuseID = @"hongbaoReuseID";
        
        MAAnnotationView *hongBaoView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:hongbaoReuseID];
        if (hongBaoView == nil)
        {
            hongBaoView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:hongbaoReuseID];
        }
        hongBaoView.image = [UIImage imageNamed:@"冒红包"];
        int a = XScaleHeight(18);
        hongBaoView.centerOffset = CGPointMake(0 , -a);
        hongBaoView.canShowCallout = YES;

        return hongBaoView;
    }
    
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        
        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:reuseIndetifier];
        }
        
//        头像大头针
//        STHeadImage *headImg = [[STHeadImage alloc]init];
//        annotationView = (UIImageView *)headImg;
        
        UIImage *headImg = [UIImage imageNamed:@"dingwei"];
        
        
        
        annotationView.image = headImg;
        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
        
        return annotationView;
    }
    return nil;
    
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
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
}

#pragma mark --- 地理围栏回调
- (void)amapLocationManager:(AMapLocationManager *)manager didEnterRegion:(AMapLocationRegion *)region
{
    NSLog(@"进入围栏:%@", region);
}

- (void)amapLocationManager:(AMapLocationManager *)manager didExitRegion:(AMapLocationRegion *)region
{
    NSLog(@"走出围栏:%@", region);
}

#pragma mark -- MAMapViewDelegate 代理方法
// 定位图层由定位点处的标注（MAUserLocation）和精度圈（MACircle）组成。
//此方法自定义  定位标注  和  精度圈  的样式
- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MAAnnotationView *view = views[0];
    
    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
    if ([view.annotation isKindOfClass:[MAUserLocation class]])
    {
        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
        pre.image = [UIImage imageNamed:@"dingwei"];
        pre.lineWidth = 2;
        pre.lineDashPattern = @[@6, @3];
        
        [self.mapView updateUserLocationRepresentation:pre];
        
        view.calloutOffset = CGPointMake(0, 0);
    } 
}


// 每秒钟调动一次 
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
//        NSLog(@"取出当前位置的坐标 latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
}

#pragma mark --  AMapLocationManagerDelegate 代理方法

//接收位置更新   每秒调用一次
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    
    NSLog(@"location:{lat:%f; lon:%f; accuracy:%f}", location.coordinate.latitude, location.coordinate.longitude, location.horizontalAccuracy);
}

-(void)leftButtonClick{
    NSLog(@"个人中心按钮被点击");
    
    STLoginViewController *LoginVc = [[STLoginViewController alloc] init];

    
    [self.navigationController pushViewController:LoginVc animated:YES];
    
    
}

#pragma mark   -------    滚动头像
-(void)setHeadCollectionView{


    UICollectionViewFlowLayout *flowLayouts = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayouts.itemSize = CGSizeMake(XScaleWidth(76),XScaleWidth(76));
    
    flowLayouts.minimumLineSpacing = 10;
//    flowLayouts.minimumInteritemSpacing = 15;
    
    flowLayouts.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
//    CGFloat CollectionViewH =  self.mapView.height - 49  - KInterval62;
    
    STHCollectionView *collectionView = [[STHCollectionView alloc] initWithFrame:CGRectMake(XScaleWidth(100), self.mapView.height - 49  - XScaleHeight(82 * 2), XScreenW, XScaleHeight(86 * 2)) collectionViewLayout:flowLayouts];
    
    self.collectionView = collectionView;
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    //    6.设置组的内间距
    //    (CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    flowLayouts.sectionInset = UIEdgeInsetsMake(10, 8, 8, 60);
    
    //    collectionView.frame = CGRectMake(0, 400, 200, XScaleHeight(KHeight136));
    
    [self.mapView addSubview:collectionView];

}
#pragma mark  -- 方法
-(void)HomeBtnClick:(UIButton *)btn{

    NSLog(@"Home按钮点击 要全员通话");

}


// cell 的点击方法
- (void)CellClick {

//    self.detailView = nil;
    if (self.detailView == nil) {
        self.detailView = [[STHInfomationView alloc]initWithFrame: CGRectMake(0,self.mapView.height - 49, XScreenW, XScaleHeight(KHeight136))];

        if ( self.collectionView.y >  self.mapView.height - 49  - XScaleHeight(82 * 2) - XScaleHeight(KHeight136)) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.detailView.hidden = NO;
            self.redAndHomeView.y = self.mapView.height -  49 - XScaleHeight(235) -XScaleHeight(KHeight136);
            self.collectionView.y =  kCollectionViewH  - XScaleHeight(KHeight136);
            
            self.detailView.y = self.mapView.height - 49 - XScaleHeight(KHeight136);
        }];

            self.detailView = [[STHInfomationView alloc]initWithFrame: CGRectMake(0,self.mapView.height - 49, XScreenW, XScaleHeight(KHeight136))];
            
            self.detailView.hidden = YES;
            
            [self.mapView addSubview: self.detailView];
            
            [UIView animateWithDuration:0.5 animations:^{
                self.detailView.hidden = NO;
                self.redAndHomeView.y = self.mapView.height -  49 - XScaleHeight(235) - XScaleHeight(KHeight136);
                self.collectionView.y =  self.mapView.height - 49  - XScaleHeight(82 * 2) - XScaleHeight(KHeight136);
                
                self.detailView.y = self.mapView.height - 49 - XScaleHeight(KHeight136);
            }];
            
        }
    
}


}

#pragma mark -- 通知方法
-(void)OpenPersonDetailNoti{

    NSLog(@"弹出详情");

    [self CellClick];

}

#pragma mark - Action Handle

- (void)configLocationManager
{
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];
    
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    [self.locationManager setAllowsBackgroundLocationUpdates:YES];
}

- (void)returnAction
{
    [self.regions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.locationManager stopMonitoringForRegion:(AMapLocationRegion *)obj];
    }];
    
    //    [super returnAction];
}

#pragma mark - AMapLocationManagerDelegate

- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"locationError:{%ld;%@}", (long)error.code, error.localizedDescription);
}

- (void)amapLocationManager:(AMapLocationManager *)manager didStartMonitoringForRegion:(AMapLocationRegion *)region
{
    NSLog(@"didStartMonitoringForRegion:%@", region);
}

- (void)amapLocationManager:(AMapLocationManager *)manager monitoringDidFailForRegion:(AMapLocationRegion *)region withError:(NSError *)error
{
    NSLog(@"monitoringDidFailForRegion:%@", error.localizedDescription);
}

//- (void)amapLocationManager:(AMapLocationManager *)manager didEnterRegion:(AMapLocationRegion *)region
//{
//    NSLog(@"didEnterRegion:%@", region);
//}
//
//- (void)amapLocationManager:(AMapLocationManager *)manager didExitRegion:(AMapLocationRegion *)region
//{
//    NSLog(@"didExitRegion:%@", region);
//}

- (void)amapLocationManager:(AMapLocationManager *)manager didDetermineState:(AMapLocationRegionState)state forRegion:(AMapLocationRegion *)region
{
    NSLog(@"didDetermineState:%@; state:%ld", region, (long)state);
}

@end
