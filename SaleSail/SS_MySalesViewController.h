//
//  MySalesViewController.h
//  SaleSail
//
//  Created by e on 1/10/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

@class SS_CommonTableDelegate;

@interface SS_MySalesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) SS_CommonTableDelegate *del;

@end
