//
//  SS_SearchResultsListViewController.h
//  SaleSail
//
//  Created by e on 1/13/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

@class SS_CommonTableDelegate;

@interface SS_SearchResultsListViewController : UIViewController {
    
    NSArray* foundSales;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) SS_CommonTableDelegate *del;
@property (nonatomic, retain) NSArray* foundSales;

@end
