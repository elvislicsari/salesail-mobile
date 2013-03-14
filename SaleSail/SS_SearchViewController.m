//
//  SSFirstViewController.m
//  SaleSail
//
//  Created by e on 1/10/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_SearchViewController.h"
#import "SS_SearchResultsViewController.h"
#import "SS_JsonDataRetriever.h"
#import "SS_Constants.h"

@interface SS_SearchViewController()

- (void) activateFindSalesButton;
- (void) deactivateFindSalesButton;
- (void) selectCellAtIndexPath:(NSIndexPath *)indexPath;

@end


@implementation SS_SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"I'm Looking For";
        self.tabBarItem.title= @"Search";
        self.tabBarItem.image = [UIImage imageNamed:@"first"];        
        findButtonActive = 0;
        searchBy = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];        
    [[SS_JsonDataRetriever sharedInstance] loadCategoriesFromServer];    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillAppear:) name:@"CATEGORIES_LOADED" object:nil];
}

-(void) viewWillAppear:(BOOL)animated {
    
    NSLog(@"SS_SearchViewController -> viewWillAppear");
    searchOptions = [[SS_JsonDataRetriever sharedInstance] categories];
    NSLog(@"searchOptions count: %lu", (unsigned long)[searchOptions count]);
    
//    [super viewWillAppear:animated];
    
    if ([[[SS_JsonDataRetriever sharedInstance] categories] count] > 0) {
        [searchTableView reloadData];
    } else {
       NSLog(@"no categories retrieved from server"); 
    }    
    
//    searchOptions = [NSArray arrayWithObjects:@"Shoes", @"Clothes", @"Electronics", @"Food", nil];
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    self.findButton.enabled = NO;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"tableView numberOfRowsInSection");
    searchTableView = tableView;
    return [searchOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView cellForRowAtIndexPath");
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSDictionary *dict = [searchOptions objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    NSNumber *catId = [dict objectForKey:@"id"];
    cell.textLabel.tag = (int) SEARCH_SALES_PLUS_UNIQUE + [catId integerValue];
//    NSLog(@"%d", cell.textLabel.tag);
//    cell.textLabel.text = [searchOptions objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"first.png"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select indexpath %@", indexPath);
    [self selectCellAtIndexPath:indexPath];
    
}

- (void) selectCellAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = [searchTableView cellForRowAtIndexPath:indexPath];
    
    NSString *catIdStr = [NSString stringWithFormat:@"%d", selectedCell.textLabel.tag];
    if (selectedCell.accessoryType == UITableViewCellAccessoryNone) {
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        selectedCell.imageView.image = [UIImage imageNamed:@"second.png"];
        
        [searchBy addObject:catIdStr];
        [self activateFindSalesButton];
    } else {
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
        selectedCell.imageView.image = [UIImage imageNamed:@"first.png"];
        [searchBy removeObject:catIdStr];
        [self deactivateFindSalesButton];
    }
    
    NSLog(@"searchBy arr: %@", searchBy);
    
    [searchTableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void) selectCellAtIndexPath:(NSIndexPath *)indexPath WithAccessory: (UITableViewCellAccessoryType) accessoryType
{
    UITableViewCell *selectedCell = [searchTableView cellForRowAtIndexPath:indexPath];
    
    NSString *catIdStr = [NSString stringWithFormat:@"%d", selectedCell.textLabel.tag];
    if (accessoryType == UITableViewCellAccessoryNone) {
        if (accessoryType != selectedCell.accessoryType) {
            selectedCell.accessoryType = accessoryType;
            selectedCell.imageView.image = [UIImage imageNamed:@"first.png"];
            [searchBy removeObject:catIdStr];
        }
        findButtonActive = 1;
        [self deactivateFindSalesButton];
    } else {
        if (accessoryType != selectedCell.accessoryType) {
            selectedCell.accessoryType = accessoryType;
            selectedCell.imageView.image = [UIImage imageNamed:@"second.png"];
            [searchBy addObject:catIdStr];
        }
        findButtonActive = [searchTableView numberOfRowsInSection:0];
        [self activateFindSalesButton];
    }
    
    NSLog(@"searchBy arr: %@", searchBy);
    
    [searchTableView deselectRowAtIndexPath:indexPath animated:NO];
}


- (void) activateFindSalesButton
{
    findButtonActive++;
    if (findButtonActive >= 1) {
        [self.findButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.findButton.enabled = YES;
    }
}

- (void) deactivateFindSalesButton
{
    findButtonActive--;
    if (findButtonActive == 0) {
        [self.findButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.findButton.enabled = NO;
    }
}

- (IBAction)findSales:(id)sender
{
    NSLog(@"s-a apasat find");
    NSMutableArray *searchByIds = [[NSMutableArray alloc] init];
    for (NSInteger i = [searchBy count] - 1; i >= 0; i--) {
        NSNumber *number = [searchBy objectAtIndex:i];
        int catValue = [number integerValue] - (int) SEARCH_SALES_PLUS_UNIQUE;
        NSNumber *catId = [NSNumber numberWithInt:catValue];
        [searchByIds addObject:catId];
    }
    NSLog(@"search by string %@", [searchByIds componentsJoinedByString:@","]);
    //ar trebuie sa trimita parametri folositi pentru search
    
    SS_SearchResultsViewController* src = [[SS_SearchResultsViewController alloc] init];
    [src setSearchByCategoriesIds:[searchByIds componentsJoinedByString:@","]];
    [[self navigationController] pushViewController:src animated:YES];
}

- (IBAction)selectAllRows:(id)sender
{
    NSLog(@"%@", self.selectAllButton.titleLabel.text);
    NSLog(@"%d", [searchTableView numberOfRowsInSection:0]);
    UITableViewCellAccessoryType accessoryType;
    if ([self.selectAllButton.titleLabel.text isEqualToString:@"All"]) {
        accessoryType = UITableViewCellAccessoryCheckmark;
        [self.selectAllButton setTitle:@"None" forState:UIControlStateNormal];
    } else {
        accessoryType = UITableViewCellAccessoryNone;
        [self.selectAllButton setTitle:@"All" forState:UIControlStateNormal];
    }
    for (int j = 0; j < [searchTableView numberOfRowsInSection:0]; j++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:0];
        [self selectCellAtIndexPath:indexPath WithAccessory:accessoryType];
    }
    
}
@end
