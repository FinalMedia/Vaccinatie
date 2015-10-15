//
//  loginViewController.h
//  Vaccincatie
//
//  Created by Mark Westenberg on 15-10-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+UIImageExtension.h"
#import "AppDelegate.h"



@interface loginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginBtnAction:(id)sender;

@end
