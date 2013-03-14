//
//  SS_CommonTableViewController.m
//  SaleSail
//
//  Created by e on 1/19/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_CommonTableDelegate.h"
#import "SS_SearchResultCell.h"
#import "SS_StoreDetailsViewController.h"

@implementation SS_CommonTableDelegate

@synthesize controller, tableData;

-(id) init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SearchItem";

    SS_SearchResultCell *cell = (SS_SearchResultCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SS_SearchResultCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@ -%@%%",
                           [[tableData objectAtIndex:indexPath.row] objectForKey:@"storeName"],
                           [[tableData objectAtIndex:indexPath.row] objectForKey:@"percent"]];
    cell.thumbnailImageView.image = [UIImage imageNamed:@"first.png"];
    cell.daysLeftLabel.text = [[tableData objectAtIndex:indexPath.row] objectForKey:@"storeAddress"];
    cell.addressLabel.text = [self getDaysLeftUntilEndDate:[[tableData objectAtIndex:indexPath.row] objectForKey:@"endTime"]];
    cell.controller = self;
    [cell setTableView:tableView];
    
    return cell;
}

-(NSString*) getDaysLeftUntilEndDate: (NSString*) endDateString {
    NSDate * now = [NSDate date];
    NSLog(@"now: %@", now);
//    NSLog(@"%d", [timestamp longValue]);
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *endDate = [df dateFromString:endDateString];
//    NSDate * endDate = [NSDate dateWithTimeIntervalSince1970:1365344745000];
    NSLog(@"endDate: %@", endDate);
    
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:now
                                                  toDate:endDate options:0];
    
//    NSInteger months = [components month];
    NSInteger days = [components day];
    
    return [NSString stringWithFormat: @"%d days left", days];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self controller] navigationItem].rightBarButtonItem.enabled = YES;
    
}

- (void)viewMoreDetailsForStore:(id)sender atIndexPath:(NSIndexPath *)ip
{
    NSLog(@"s-a apasat viewMoreDetailsForStoreatIndexPath din favorites");
    
    NSLog(@"sender %@", sender);
    
    NSLog(@"ip %@", ip);
    
    SS_StoreDetailsViewController *sdc = [[SS_StoreDetailsViewController alloc] init];
    [[[self controller] navigationController] pushViewController:sdc animated:YES];
    
}

@end
