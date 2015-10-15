//
//  loginViewController.m
//  Vaccincatie
//
//  Created by Mark Westenberg on 15-10-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import "loginViewController.h"
#import "GeneralSettings.h"

@interface loginViewController ()

@end

@implementation loginViewController

@synthesize loginBtn=_loginBtn;


- (void)viewDidLoad {
    [super viewDidLoad];
    [_loginBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0.027 green:0.184 blue:0.345 alpha:1.000]] forState:UIControlStateNormal];
    GeneralSettings *settings = [[GeneralSettings alloc] initWithView:self.view andNavController:self.navigationController];
    self.navigationItem.titleView = [settings setupNavigationBar];
    [settings setNavColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (IBAction)loginBtnAction:(id)sender {
}
@end
