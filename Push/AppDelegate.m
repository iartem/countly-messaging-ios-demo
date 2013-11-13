//
//  AppDelegate.m
//  Push
//
//  Created by Artem Salpagarov on 9/25/13.
//  Copyright (c) 2013 Artem Salpagarov. All rights reserved.
//

#import "AppDelegate.h"
#import "Countly.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[Countly sharedInstance] startWithMessagingUsing:@"720e1d07b5dd7263a0a7a42b96c159bb9ca85e43" forHost:@"http://162.243.29.190" andOptions:launchOptions];
//    [[Countly sharedInstance] startWithMessagingUsing:@"60758257b5a8595a96648296f4e04c4f923e4f6f" forHost:@"http://192.168.0.100:3001" andOptions:launchOptions];
    
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge];
    
    return YES;
}

- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"Got APNS token");
    [[Countly sharedInstance] didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Failed to get APNS token: %@", error.localizedDescription);
    [[Countly sharedInstance] didFailToRegisterForRemoteNotifications];
}

- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[Countly sharedInstance] handleRemoteNotification:userInfo];
}

//- (void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    if (![[Countly sharedInstance] handleRemoteNotification:userInfo]) {
//        
//    }
//}

@end
