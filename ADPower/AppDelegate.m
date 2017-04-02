//
//  AppDelegate.m
//  ADPower
//
//  Created by chengxc on 2016/10/29.
//  Copyright © 2016年 chengxue. All rights reserved.
//

#import "AppDelegate.h"
#import "MCTabBarController.h"
#import "MCLaunchADViewController.h"
#import <EMSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建窗口
    self.window  = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置窗口的根控制器，一开始想显示谁就设置谁为窗口的根控制器
    MCLaunchADViewController *ADViewController = [[MCLaunchADViewController alloc] init];
    self.window.rootViewController = ADViewController;
    
    //MCADPViewController *vc = [[MCADPViewController alloc] init];
    //UINavigationController *navi = tabbarC.childViewControllers[0];
    //[navi pushViewController:vc animated:YES];
    
    //窗口要显示时会自动将根控制器的view添加到窗口上
    //makeKey: UIApplication主窗口
    //Visible: hidden = NO;
    [self.window makeKeyAndVisible];
    
    
    EMOptions *options = [EMOptions optionsWithAppkey:kEaseAppkey];
    options.apnsCertName = kEaseApnsCertName;
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EMClient sharedClient] applicationDidEnterBackground:application];
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
