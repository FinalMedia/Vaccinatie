//
//  MenuViewController.m
//  RevealControllerStoryboardExample
//
//  Created by Nick Hodapp on 1/9/13.
//  Copyright (c) 2013 CoDeveloper. All rights reserved.
//

#import "MenuViewController.h"
#import "AppDelegate.h"

@implementation SWUITableViewCell
@end

@implementation MenuViewController {
    
    NSArray *menuItems;
    NSDictionary *notificationInfo;
    AppDelegate *appdelegate;
    NSString *page;
}

@synthesize tableView=_tableView;

-(void)viewDidLoad {
    [super viewDidLoad];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = [UIColor colorWithRed:0.000 green:0.337 blue:0.580 alpha:1.000];
    
    menuItems = [NSArray arrayWithObjects:@"overzicht",@"afspraken",@"rvpinfo",@"rivminfo",@"instellingen",nil];
    
    
}



-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    appdelegate = [[UIApplication sharedApplication] delegate];
    page = [appdelegate readData:@"page"];
    if (page == nil || [page isEqualToString:@""])
    {
        page = @"overzicht";
    }
    
}


- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
//    //configure the destination view controller:
    if ( [sender isKindOfClass:[UITableViewCell class]] )
    {
       // NSLog(@"I WAS HERE");
       // SWUITableViewCell* cell = (SWUITableViewCell *)sender;
       // [cell.textLabel setFont:[UIFont fontWithName:@"Ubuntu-Bold" size:20]];
    }
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CellIdentifier = menuItems[indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    if ([CellIdentifier isEqualToString:@"header"])
    {
        cell.userInteractionEnabled = NO;
        [cell.textLabel setFont:[UIFont fontWithName:@"Ubuntu-Bold" size:20]];
        
    }
    else
    {
        
        if ([page isEqualToString:CellIdentifier]) {
            [cell.textLabel setFont:[UIFont boldSystemFontOfSize:18]];
            NSLog(@"page: %@",page);
        }
        else
        {
            [cell.textLabel setFont:[UIFont systemFontOfSize:18]];
        }

        
        UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(30.0, 79.0, self.view.bounds.size.width-100, 1)];
        bottomLineView.backgroundColor = [UIColor grayColor];
        //[cell.contentView addSubview:bottomLineView];
    }
    
    
    
    
    
    return cell;
}

@end
