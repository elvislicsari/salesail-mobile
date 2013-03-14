//
//  SS_SearchResultsListViewController.m
//  SaleSail
//
//  Created by e on 1/13/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_SearchResultsListViewController.h"
#import "SS_GetDirectionsViewController.h"
#import "SS_CommonTableDelegate.h"

@implementation SS_SearchResultsListViewController

@synthesize foundSales;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"Search Results";
        self.navigationItem.backBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                         style:UIBarButtonItemStyleBordered
                                        target:nil
                                        action:nil];
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                target:self
                                action:@selector(getDirections)];
        bbi.enabled = NO;
        [[self navigationItem] setRightBarButtonItem:bbi];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    

    self.del = [[SS_CommonTableDelegate alloc] init];
    [self.del setController:self];
    
    NSLog(@"SS_SearchResultsListViewController >>> viewDidLoad");
    NSLog(@"SS_SearchResultsListViewController found sales count %d", [[self foundSales] count]);
    
    [self.del setTableData: [self foundSales]];
    
    [self.tableView setDelegate: self.del];
    [self.tableView setDataSource: self.del];        
}

- (void) getDirections {
    SS_GetDirectionsViewController *sdc = [[SS_GetDirectionsViewController alloc] init];
    [[self navigationController] pushViewController:sdc animated:YES];
}


@end
