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

@interface AppDelegate ()

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
    // Override point for customization after application launch.
    
//    NSLog(@" XScaleHeight  %f", XScaleHeight(100));
//    
//    NSLog(@"XScaleWidth %f",XScaleWidth(100));
//
    NSLog(@" Height  %f",  [UIScreen mainScreen].bounds.size.height);
    NSLog(@" KScaleHeight  %f", KScaleHeight(68 * 2));
//
//    NSLog(@"KScaleWidth %f",KScaleWidth(100));
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
