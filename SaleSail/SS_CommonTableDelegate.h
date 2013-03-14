//
//  SS_CommonTableViewController.h
//  SaleSail
//
//  Created by e on 1/19/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SS_CommonTableDelegate : NSObject <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tableData;
    UIViewController *controller;
}

@property (nonatomic) UIViewController *controller;
@property (nonatomic) NSArray *tableData;

@end
