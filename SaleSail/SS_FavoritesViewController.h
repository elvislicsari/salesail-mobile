//
//  SS_FavoritesViewController.h
//  SaleSail
//
//  Created by e on 1/16/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

@class SS_CommonTableDelegate, SS_LoginViewController;

@interface SS_FavoritesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) SS_CommonTableDelegate *del;
@property (nonatomic, retain) SS_LoginViewController *loginController;

@end
