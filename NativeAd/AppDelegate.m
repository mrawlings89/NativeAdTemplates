//
//  AppDelegate.m
//  NativeAd
//
//  Created by Yun Peng Wang on 11/7/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "AppDelegate.h"
#import <Leanplum/Leanplum.h>
#import <LeanplumUIEditor/LeanplumUIEditor.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

DEFINE_VAR_BOOL(showAlternateAdExperience, false)


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    #ifdef DEBUG
        LEANPLUM_USE_ADVERTISING_ID;
        [Leanplum setAppId:@"app_fw6x1clIHUjMmIVg2nmfgwHvCT3AAXjzmIfsOyGwZMU"
        withDevelopmentKey:@"dev_Oi5PowpWoBUDyArOYVhmgzbaJr80IABV2PSggQMiTSE"];
        NSLog(@"Launched w DEV keys");
    #else
        [Leanplum setAppId:@"app_fw6x1clIHUjMmIVg2nmfgwHvCT3AAXjzmIfsOyGwZMU"
         withProductionKey:@"prod_2ub8JQ40tFHTyUDye4apv7aRvzcFvaIKod7oK527IUI"];
    #endif
    
    [Leanplum syncResourcePaths:@[@"MyResources/.*"] excluding:nil async:YES];
    [Leanplum trackInAppPurchases];
    [Leanplum trackAllAppScreens];
    [[LeanplumUIEditor sharedEditor] allowInterfaceEditing];
    
    [Leanplum start];
    
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
