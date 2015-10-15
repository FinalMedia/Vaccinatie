//
//  GeneralSettings.m
//  Vaccincatie
//
//  Created by Mark Westenberg on 17-09-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import "GeneralSettings.h"

@implementation GeneralSettings


-(id)initWithView:(UIView *)parentView {
    
    if (self = [super init])
    {
        view = parentView;
    }
    
    return self;
}

-(id)initWithNavController:(UINavigationController *)parentNavController {
    
    if (self = [super init])
    {
        navController = parentNavController;
    }
    [self positionColoredLine];
    return self;
}


-(id)initWithView:(UIView *)parentView andNavController:(UINavigationController *)parentNavController {
    
    if (self = [super init])
    {
        view = parentView;
        navController = parentNavController;
    }
    
    
    [self positionColoredLine];
    return self;
}


-(UIImageView *)setupNavigationBar {
    
    [navController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [navController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    UIImage *image = [UIImage imageNamed: @"logo_menu"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage: image];
    //[navController.navigationBar setFrame:CGRectMake(0, 0, view.bounds.size.width, 80)];
    
    
    return imageview;
}


-(void)positionColoredLine {
    
    for (UIView *subview in view.subviews) {
        if (subview.tag==1)
        {

            //in case of nav controller set to pos to 0 for the colored line
            float posY = 0;
            if (navController.navigationBar.tag!=1)
            {
                posY = 64; //set it to 64 exactly below the navbar
            }
            
            CGRect newFrame = CGRectMake(subview.frame.origin.x, posY, subview.frame.size.width, subview.frame.size.height);
            subview.frame = newFrame;
        }
    }
    
}


//setup all the colors for the navigation bar
-(void)setNavColor {
    [navController.navigationBar setTintColor:[UIColor whiteColor]];
    [navController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [navController.navigationBar setBackgroundColor:[UIColor colorWithRed:0.000 green:0.337 blue:0.580 alpha:1.000]];
}



@end
