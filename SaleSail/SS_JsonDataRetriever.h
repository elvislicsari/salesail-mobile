//
//  SS_JsonDataRetriever.h
//  SaleSail
//
//  Created by e on 2/14/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SS_JsonDataRetriever : NSObject {
    
    NSString *echoUrl;
}

+ (SS_JsonDataRetriever *)sharedInstance;

@property(nonatomic, retain) NSArray *categories;
@property(nonatomic, retain) NSArray *sales;

- (void) loadCategoriesFromServer;
- (void) loadSeachSalesFromServer: (NSString*) forCategories;

@end
