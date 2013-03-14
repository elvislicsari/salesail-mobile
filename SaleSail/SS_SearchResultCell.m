//
//  SS_SearchResultCell.m
//  SaleSail
//
//  Created by e on 1/14/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_SearchResultCell.h"
#import "SS_StoreDetailsViewController.h"
#import "SSAppDelegate.h"

@implementation SS_SearchResultCell

@synthesize nameLabel = _nameLabel;
@synthesize addressLabel = _addressLabel;
@synthesize daysLeftLabel = _daysLeftLabel;
@synthesize thumbnailImageView = _thumbnailImageView;
@synthesize controller;
@synthesize tableView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)viewMoreDetailsForStore:(id)sender {
    NSLog(@"s-a apasat viewMoreDetailsForStore din cell");
    
    NSString *selector = NSStringFromSelector(_cmd);
    selector = [selector stringByAppendingString:@"atIndexPath:"];
    SEL newSelector = NSSelectorFromString(selector);
    
    NSIndexPath *indexPath = [[self tableView] indexPathForCell:self];
    if(indexPath) {
        if([controller respondsToSelector:newSelector]) {
            [controller performSelector:newSelector withObject:sender
                             withObject:indexPath];
        }
    }
}
@end
