//
//  AppDelegate.m
//  Chef Curry
//
//  Created by Jackson Sierra on 3/20/16.
//  Copyright © 2016 Jackson Sierra. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <AFNetworking.h>
#include "constants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
      [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound|UIUserNotificationTypeNone) categories:nil]];
  } else {
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeNone)];
  }
  
  NSDictionary *remoteNotif = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
  if (remoteNotif) {
    [self handleRemoteNotification:[remoteNotif valueForKey:@"type"]];
    return YES;
  }
  
  [self getApplicationState];
  
  return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  NSLog(@"%@", userInfo);
  [self handleRemoteNotification:[userInfo valueForKey:@"type"]];
}

- (void)handleRemoteNotification:(NSString *)type {
  if (type) {
    ViewController *controller = (ViewController *)self.window.rootViewController;
    [controller setStatus:type];
    [controller updateUI];
  }
}

- (void)getApplicationState {
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  [manager setResponseSerializer:[AFJSONResponseSerializer serializer]];
  
  [manager GET:AppStateApiURL
     parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSLog(@"%@", operation.responseString);          
          NSString *type = [responseObject valueForKey:@"type"];
          [self handleRemoteNotification:type];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"%@", operation.responseString);
          [self handleRemoteNotification:@"none"];
          NSLog(@"Failed to retrieve application state: %@", error);
        }
   ];
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

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
  [application registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  const unsigned *tokenBytes = [deviceToken bytes];
  NSString *token = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x", ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]), ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]), ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
  
  NSLog(@"%@", token);
  
  if (token) {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:TokenApiURL
       parameters:@{@"device_token": token}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self handleRemoteNotification:@"none"];
            NSLog(@"Failed to send device token to server: %@", error);
          }
    ];
  }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
  NSLog(@"Failed to get device token: %@", error);
}

@end
