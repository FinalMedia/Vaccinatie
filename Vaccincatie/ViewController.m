//
//  ViewController.m
//  Vaccincatie
//
//  Created by Mark Westenberg on 17-09-15.
//  Copyright © 2015 Mark Westenberg. All rights reserved.
//

#import "ViewController.h"
#import "GeneralSettings.h"

@interface ViewController () {
    
    NSArray *tableData;
    AppDelegate *appDelegate;
}

@end

@implementation ViewController

@synthesize revealButtonItem=_revealButtonItem, buttonView=_buttonView,headerView=_headerView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didlocalNotificationReceived:) name:@"localNotificationReceived" object:nil];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //General settings
    GeneralSettings *settings = [[GeneralSettings alloc] initWithView:self.view andNavController:self.navigationController];
    self.navigationItem.titleView = [settings setupNavigationBar];
    [settings setNavColor];
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.revealButtonItem setTarget: revealViewController];
        [self.revealButtonItem setAction: @selector( revealToggle: )];
        [self.navigationController.navigationBar addGestureRecognizer:revealViewController.panGestureRecognizer];
        
    }
    
   // [self createNotifLabel: 1];
    [self setMainButtons];
    
    NSString *counterStr = [appDelegate readData:@"badgeNo"];
    if (counterStr == nil)
    {
        counterStr = [NSString stringWithFormat:@"%d",0];
        [appDelegate saveData:@"badgeCounter" withObject:counterStr];
    }
    
    int counter = [counterStr intValue];
    
    if (counter>0)
    {
        [self createNotifLabel:counter];
    }
    
    
}


-(void)viewDidAppear:(BOOL)animated {
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10.0];
    localNotification.alertBody = @"Uitslag van uw hielprik is binnen";
    localNotification.alertAction = @"Goed nieuws bericht";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
}


-(void)createNotifLabel:(int)badgeNo {
       
    
    //bel icon
    UIImageView *belIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bel_icon"]];
    
    //badge reddot
    UIImage *red_cirle = [UIImage imageNamed:@"red_circle"];
    UIImageView *redDot = [[UIImageView alloc] initWithFrame:CGRectMake(belIcon.frame.size.width- (red_cirle.size.width/2), -8, red_cirle.size.width, red_cirle.size.height)];
    redDot.image = red_cirle;
    
    
    //badge no
    UILabel *no = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, redDot.frame.size.width, redDot.frame.size.height)];
    no.text = [NSString stringWithFormat:@"%d",badgeNo];
    no.font = [UIFont systemFontOfSize:8.0];
    no.textColor = [UIColor whiteColor];
    no.textAlignment = NSTextAlignmentCenter;
    [redDot addSubview:no];
    
    [belIcon addSubview:redDot];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:belIcon];
    menuButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = menuButton;
    
    
    
    
    
}


-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent; // your own style
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
    [appdelegate saveData:@"page" withObject:@"overzicht"];
}


//calculates the button size and places them
-(void)setMainButtons {
    
    
    
    float maxWidth = self.view.frame.size.width;
    float maxheight = self.view.frame.size.height - _headerView.frame.size.height - self.navigationController.navigationBar.frame.size.height;
    float posY = _headerView.frame.origin.y + _headerView.frame.size.height + self.navigationController.navigationBar.frame.size.height;
    float containerPadding = 20.0f;
    
    CGRect newFrame = CGRectMake(containerPadding, posY, maxWidth-(containerPadding*2), maxheight-(containerPadding*2)-20.0f);
    _buttonView.frame = newFrame;
    
    CGRect containerView = _buttonView.frame;
    
    float width = containerView.size.width;
    float height = containerView.size.height;
    float calc = 0.0f;
    float diff = 0.0f;
    float padding = 2.0f;
    
    if (width < height)
    {
        calc = width;
        diff = height - calc;
    }
    else
    {
        calc = height;
        diff = width - calc-padding;
    }
    
    
    float half = (calc/2) - padding;
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(diff/2, 0, half, half)];
   // button1.backgroundColor = [UIColor redColor];
    [button1 setBackgroundImage:[UIImage imageNamed:@"afspraken_icon"] forState:UIControlStateNormal];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(buttonActions:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(width-half-(diff/2), 0, half, half)];
    //button2.backgroundColor = [UIColor blueColor];
    [button2 setBackgroundImage:[UIImage imageNamed:@"RVP_info_icon"] forState:UIControlStateNormal];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(buttonActions:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(diff/2, half+(padding*2), half, half)];
    //button3.backgroundColor = [UIColor greenColor];
    [button3 setBackgroundImage:[UIImage imageNamed:@"RIVM_info_icon"] forState:UIControlStateNormal];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(buttonActions:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(width-half-(diff/2), half+(padding*2), half, half)];
   // button4.backgroundColor = [UIColor purpleColor];
    [button4 setBackgroundImage:[UIImage imageNamed:@"instellingen_icon"] forState:UIControlStateNormal];
    button4.tag = 4;
    [button4 addTarget:self action:@selector(buttonActions:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_buttonView addSubview:button1];
    [_buttonView addSubview:button2];
    [_buttonView addSubview:button3];
    [_buttonView addSubview:button4];
 
    
}

//the button actions
-(void)buttonActions:(id)sender {
    
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1:
            [self performSegueWithIdentifier:@"afspraken" sender:self];
            break;
        case 2: [self performSegueWithIdentifier:@"rvpinfo" sender:self];
            break;
        case 3: [self performSegueWithIdentifier:@"rivminfo" sender:self];
            break;
        default:
            [self performSegueWithIdentifier:@"instellingen" sender:self];
            break;
    }
    
}


#pragma mark delegates

- (void)didlocalNotificationReceived:(NSNotification *)notification {
    NSLog(@"triggered notification");
    NSString *counterStr = [appDelegate readData:@"badgeNo"];
    if (counterStr == nil)
    {
        counterStr = [NSString stringWithFormat:@"%d",0];
    }
    
    int counter = [counterStr intValue];
    counter++;
    
    [appDelegate saveData:@"badgeCounter" withObject:[NSString stringWithFormat:@"%d",counter]];
    
    
    [self createNotifLabel: counter];
}





@end
