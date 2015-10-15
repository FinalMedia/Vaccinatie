//
//  AppDelegate.m
//  Vaccincatie
//
//  Created by Mark Westenberg on 17-09-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import "AppDelegate.h"




@interface AppDelegate ()



@end



@implementation AppDelegate

@synthesize settings=_settings;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    UIView *addStatusBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MAXFLOAT, 20)];
    addStatusBar.backgroundColor = [UIColor colorWithRed:0.000 green:0.337 blue:0.580 alpha:1.000];
    //addStatusBar.tintColor = [UIColor whiteColor];
    //[[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
    [self.window.rootViewController.view addSubview:addStatusBar];
    
    
    //notification stuff
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    

    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        UILocalNotification *localNotification = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"localNotificationReceived" object:self userInfo:localNotification.userInfo];
    }
    
    NSDictionary *remoteNotificationPayload = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (remoteNotificationPayload) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"localNotificationReceived" object:nil userInfo:remoteNotificationPayload];
    }
    
    //set it to 0
    [self saveData:@"badgeCounter" withObject:[NSString stringWithFormat:@"%d",0]];
    
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Informatie van RIVM"
                                      message:@"Goed nieuws bericht"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        
        [alert addAction:ok];
        

        [self.window.rootViewController presentViewController:alert animated:true completion:nil];
 
        
        
    }
    //NSLog(@"appdelegate: %@",notification.userInfo);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"localNotificationReceived" object:self userInfo:notification.userInfo];
    
    // Set icon badge number to zero
    application.applicationIconBadgeNumber = 0;
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



#pragma mark userdefaults

-(void)saveData:(NSString *)key withObject:(id)value {
    _settings = [NSUserDefaults standardUserDefaults];
    [_settings setObject:value forKey:key];
    [_settings synchronize];
    
}


-(id)readData:(NSString *)key {
    _settings = [NSUserDefaults standardUserDefaults];
    id value = [_settings objectForKey:key];
    if (value)
    {
        return value;
    }
    else
    {
        return nil;
    }
    
}

#pragma mark state preservation / restoration

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

@end
