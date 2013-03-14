//
//  SS_StoreDetailsViewController.h
//  SaleSail
//
//  Created by e on 1/14/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SS_StoreDetailsViewController : UIViewController {
    
    NSArray *detailsData;
    NSArray *fourSquareData;
    BOOL showingFourSquareComments;
}

@property (weak, nonatomic) IBOutlet UITableView *detailsTable;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *headerViewNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerViewImage;
@property (weak, nonatomic) IBOutlet UIButton *headerView4SquareButton;

@property (weak, nonatomic) IBOutlet UILabel *fourSquareLabel;
@property (weak, nonatomic) IBOutlet UITableView *fourSquareCommentsTable;

- (IBAction)show4SquareDetails:(id)sender;
@end
