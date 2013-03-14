//
//  SS_FavoritesViewController.m
//  SaleSail
//
//  Created by e on 1/16/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_FavoritesViewController.h"
#import "SS_GetDirectionsViewController.h"
#import "SS_CommonTableDelegate.h"
#import "SS_LoginViewController.h"

@implementation SS_FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Favorites";
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                target:self
                                action:@selector(getDirections)];
        bbi.enabled = NO;
        [[self navigationItem] setRightBarButtonItem:bbi];
        
        self.navigationItem.backBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                         style:UIBarButtonItemStyleBordered
                                        target:nil
                                        action:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //test if the user is logged in
    //if not, then login form is shown
   
    
    
//    NSLog(@"f 1");
//    self.del = [[SS_CommonTableDelegate alloc] init];
//    [self.del setController:self];
//
//    [self.del setTableData: [NSArray arrayWithObjects:@"F-Zara rulz", @"F-Zara sux", @"F-Pula si ursu", @"F-Pula lu ursu", nil]];
//    
//    [self.tableView setDelegate: self.del];
//    [self.tableView setDataSource: self.del];
}

-(void) viewWillAppear:(BOOL)animated {
    self.loginController = [[SS_LoginViewController alloc] init];
    if ([self.loginController isUserAuthentificated] == NO) {
        [self.loginController displayLoginView];
    }
}



- (void) getDirections {
    SS_GetDirectionsViewController *sdc = [[SS_GetDirectionsViewController alloc] init];
    [[self navigationController] pushViewController:sdc animated:YES];
}




@end
