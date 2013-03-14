//
//  SS_SearchResultCell.h
//  SaleSail
//
//  Created by e on 1/14/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SS_SearchResultCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysLeftLabel;

@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@property (weak, nonatomic) id controller;
@property (weak, nonatomic) UITableView *tableView;

- (IBAction)viewMoreDetailsForStore:(id)sender;
@end
