//
//  SSFirstViewController.h
//  SaleSail
//
//  Created by e on 1/10/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SS_SearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    @private
    int findButtonActive;
    UITableView* searchTableView;
    NSMutableArray* searchBy;
    NSArray *searchOptions;
}

@property (weak, nonatomic) IBOutlet UIButton *findButton;
@property (weak, nonatomic) IBOutlet UIButton *selectAllButton;

- (IBAction)findSales:(id)sender;
- (IBAction)selectAllRows:(id)sender;

@end
