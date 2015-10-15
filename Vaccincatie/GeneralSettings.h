//
//  GeneralSettings.h
//  Vaccincatie
//
//  Created by Mark Westenberg on 17-09-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//


#import <UIKit/UIKit.h>



@interface GeneralSettings : NSObject {
    UINavigationController *navController;
    UIView *view;
    UIViewController *viewController;
    
}


-(id)initWithView:(UIView *)parentView ;
-(id)initWithNavController:(UINavigationController *)parentNavController;
-(id)initWithView:(UIView *)parentView andNavController:(UINavigationController *)parentNavController;
-(UIImageView *)setupNavigationBar;
-(void)setNavColor;
-(void)positionColoredLine;

@end
