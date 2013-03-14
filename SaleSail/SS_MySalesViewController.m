//
//  MySalesViewController.m
//  SaleSail
//
//  Created by e on 1/10/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_MySalesViewController.h"
#import "SS_GetDirectionsViewController.h"
#import "SS_CommonTableDelegate.h"

@implementation SS_MySalesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"My Sales";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
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
   
//    self.del = [[SS_CommonTableDelegate alloc] init];
//    [self.del setController:self];
//    
//    [self.del setTableData: [NSArray arrayWithObjects:@"MS-Zara rulz", @"MS-Zara sux", @"MS-Pula si ursu", @"MS-Pula lu ursu", nil]];
//    
//    [self.tableView setDelegate: self.del];
//    [self.tableView setDataSource: self.del];
}

- (void) getDirections {
    SS_GetDirectionsViewController *sdc = [[SS_GetDirectionsViewController alloc] init];
    [[self navigationController] pushViewController:sdc animated:YES];
}

@end
