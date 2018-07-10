//
//  AppDelegate.m
//  MOANavigationBarManager
//
//  Created by fjf on 2018/6/5.
//  Copyright © 2018年 fjf. All rights reserved.
//

#import "AppDelegate.h"
#import "FJTabbarViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSArray *viewControllerArray = [NSArray arrayWithObjects:
                                    @"FJCourseViewController",
                                    @"FJDiscoverViewController",
                                    @"FJShopViewController",
                                    @"FJProfileViewController",
                                    nil];
    
    NSArray *imageNameArray = [NSArray arrayWithObjects:
                               @"tab_jingxuan_hui.png",
                               @"tab_faxian_hui.png",
                               @"tab_dianpu_hui.png",
                               @"tab_wode_hui.png",
                               nil];
    
    NSArray *selectedImageNameArray = [NSArray arrayWithObjects:
                                       @"tab_jingxuan_xuanzhong.png",
                                       @"tab_faxian_xuanzhong.png",
                                       @"tab_dianpu_xuanzhong.png",
                                       @"tab_wode_xuanzhong.png",
                                       nil];
    
    NSArray *titleArray = [NSArray arrayWithObjects:
                           @"精选",
                           @"发现",
                           @"店铺",
                           @"我的",
                           nil];
    
    FJTabbarViewController *tabbarViewController = [[FJTabbarViewController alloc] initWithViewControllerArray:viewControllerArray imageNameArray:imageNameArray selectedImageNameArray:selectedImageNameArray titleArray:titleArray];;
    self.window.rootViewController = tabbarViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
