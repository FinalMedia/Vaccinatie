//
//  AppDelegate.h
//  Vaccincatie
//
//  Created by Mark Westenberg on 17-09-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSUserDefaults *settings;


-(id)readData:(NSString *)key;
-(void)saveData:(NSString *)key withObject:(id)value;

@end

