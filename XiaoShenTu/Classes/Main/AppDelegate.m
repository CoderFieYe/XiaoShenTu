//
//  AppDelegate.m
//  XiaoShenTu
//
//  Created by 万启鹏 on 16/6/27.
//  Copyright © 2016年 万启鹏. All rights reserved.
//

#import "AppDelegate.h"
#import "STGuideController.h"
#import "STTabBarController.h"

#import "SFHFKeychainUtils.h"
#import <AdSupport/AdSupport.h>
#import <RongIMKit/RongIMKit.h>

@interface AppDelegate ()<RCIMUserInfoDataSource>

@end

@implementation AppDelegate

- (BOOL)isNewVersion {

//    1.获取应用的版本号
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
    NSString *currentVersion = infoDict[@"CFBundleShortVersionString"];
    
//    2.获取之前存储的版本号
//    2.1 获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    2.2 获取
    NSString *oldVersion = [defaults objectForKey:@"STApp_version"];
//    3.比较
//    3.1 如果两个版本号相同, 直接显示主界面[标签控制器]
    if ([oldVersion isEqualToString:currentVersion]) {
        return NO;//  不是新版本直接进入主程序
        
    }else{
    
//        3.2 否则先显示新特性界面,并将最新的 版本号存取来
//        /存储数据
        [defaults setObject:currentVersion forKey:@"STApp_version"];
        
//        同步
        [defaults synchronize];
        return YES;
    
    }
    

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   

    // 融云
    [[RCIM sharedRCIM]initWithAppKey:@"sfci50a7c7a8i"];
    
    [[RCIM sharedRCIM] connectWithToken:@"/nfxDWyiVyfOfH1mYuz+ZuiloZdM//845nNMEgWAaz0KIQcCG9NzQo1S1Zq5k4Qej1/m7bQecXCoR8XU73yKuQ==" success:^(NSString *userId) {
        
        //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        NSLog(@"登录成功，当前用户ID ＝ %@",userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登录失败，错误码 ＝ %ld",(long)status);

    } tokenIncorrect:^{
        NSLog(@"token 错误");
    }];
    
    

//    NSLog(@" XScaleHeight  %f", XScaleHeight(100));
//    
//    NSLog(@"XScaleWidth %f",XScaleWidth(100));
//
    NSLog(@" Height  %f",  [UIScreen mainScreen].bounds.size.height);
    NSLog(@" XScaleHeight  %f", XScaleHeight(68 * 2));
//
//    NSLog(@"XScaleWidth %f",XScaleWidth(100));
//    

    
//    1.创建窗口
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
     self.window.rootViewController = [[STTabBarController alloc] init];
//    2.创建控制器
//    3.设置窗口的根控制器
////    3.1 如果为旧版本直接为标签控制器
//    if(![self isNewVersion]){
//    
//        self.window.rootViewController = [[STTabBarController alloc] init];
//
//    }else{
//    
//        NSLog(@"新特性控制器");
////        创建新特性控制器
//        STGuideController *guideVc = [[STGuideController alloc] init];
//        
////        显示新特性控制器
//        self.window.rootViewController = guideVc;
//    
//    }
    
//    //        创建新特性控制器
//            STGuideController *guideVc = [[STGuideController alloc] init];
//    
//    //        显示新特性控制器
//            self.window.rootViewController = guideVc;
//    4.作为主窗口并显示
    [self.window makeKeyAndVisible];
    
//    /5.设置状态栏的效果
    application.statusBarHidden = NO;
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    //    UUID
    NSString *str =  [self UUID];
    NSLog(@"  UUID 是  %@",str);
    
    return YES;
    
}

/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion
{
    //此处为了演示写了一个用户信息
    if ([@"001" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"001";
        user.name = @"test1";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        completion(user);
    }else if([@"2301" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"2301";
        user.name = @"小神兔1";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        return completion(user);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -获取唯一UUID

- (NSString*)UUID {
    
    
   NSString  *uuid = uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];;
    
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    
    NSString *userName = infoDict[@"CFBundleName"];
    
    NSString *serviceName = infoDict[@"CFBundleIdentifier"];
    
    NSString *UUID = [SFHFKeychainUtils getPasswordForUsername:userName         andServiceName:serviceName error:nil];
    
    if (UUID.length==0) {
        
        UUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        
        [SFHFKeychainUtils storeUsername:userName andPassword:UUID forServiceName:serviceName updateExisting:1 error:nil];
        
    }
    
    return UUID;
    
}

@end
