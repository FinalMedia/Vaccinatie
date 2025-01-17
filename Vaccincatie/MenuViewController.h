//
//  MenuViewController.h
//  RevealControllerStoryboardExample
//
//  Created by Nick Hodapp on 1/9/13.
//  Copyright (c) 2013 CoDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"


@interface SWUITableViewCell : UITableViewCell
@property (nonatomic) IBOutlet UILabel *label;
@end

@interface MenuViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
