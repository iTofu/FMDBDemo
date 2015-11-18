//
//  AppDelegate.m
//  FMDBDemo
//
//  Created by Leo on 15/10/21.
//  Copyright © 2015年 Leo. All rights reserved.
//

#import "AppDelegate.h"
#import "DBManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    NSString *localKey = @"notFirstLaunch";
    
    BOOL notFirstLaunch = [[NSUserDefaults standardUserDefaults] boolForKey:localKey];
    
//#warning 测试用，上线请删除
//    notFirstLaunch = NO;
    
    // 如果是第一次启动
    if (!notFirstLaunch) {
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:localKey];
        
        // 创建数据库和相关表: Insert all data
        [[DBManager sharedManager] initDB:^(BOOL success) {
            
            if (!success) {
                
                NSLog(@"ERR: 数据库第一次写入数据好像发生了某些错误");
                
            } else {
                
                NSLog(@"OOK: 数据库第一次写入数据成功");
            }
        }];
    }
    
    
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

@end
