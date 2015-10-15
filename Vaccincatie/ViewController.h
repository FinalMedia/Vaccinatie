//
//  ViewController.h
//  Vaccincatie
//
//  Created by Mark Westenberg on 17-09-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "AppDelegate.h"



@interface ViewController : UIViewController





@property (nonatomic) IBOutlet UIBarButtonItem* revealButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (weak, nonatomic) IBOutlet UIImageView *headerView;




@end

