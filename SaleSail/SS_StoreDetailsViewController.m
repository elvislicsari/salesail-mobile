//
//  SS_StoreDetailsViewController.m
//  SaleSail
//
//  Created by e on 1/14/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_StoreDetailsViewController.h"
#import "SS_GetDirectionsViewController.h"

@implementation SS_StoreDetailsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Sale Sail";
    detailsData = [NSArray arrayWithObjects:@"0748 777 666", @"+Remider", @"+Favorites", @"Share", nil];
    fourSquareData = [NSArray arrayWithObjects:@"Ceva comment 1", @"Ceva comment 2", nil];
    self.headerViewNameLabel.text = @"Zara rulz si alte detalii";
    self.headerViewImage.image = [UIImage imageNamed:@"second.png"];
    showingFourSquareComments = NO;
    
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                            target:self
                            action:@selector(getDirections)];
    [[self navigationItem] setRightBarButtonItem:bbi];
}

-(NSArray*) getTableArrayWithData {
    if (showingFourSquareComments == NO) {
        return detailsData;
    } else {
        return fourSquareData;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* tableData = [self getTableArrayWithData];
//    NSLog(@"%@", tableData);
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    NSArray* tableData = [self getTableArrayWithData];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"first.png"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (IBAction)show4SquareDetails:(id)sender {
    if (showingFourSquareComments == NO) {
        showingFourSquareComments = YES;
        self.detailsTable.hidden = YES;
        self.fourSquareLabel.hidden = NO;
        self.fourSquareCommentsTable.hidden = NO;
        [self.fourSquareCommentsTable reloadData];
    } else {
        showingFourSquareComments = NO;
        self.detailsTable.hidden = NO;
        self.fourSquareLabel.hidden = YES;
        self.fourSquareCommentsTable.hidden = YES;
        [self.detailsTable reloadData];
    }

}

- (void) getDirections {
    SS_GetDirectionsViewController *sdc = [[SS_GetDirectionsViewController alloc] init];
    [[self navigationController] pushViewController:sdc animated:YES];
}
@end
