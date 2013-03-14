//
//  SS_JsonDataRetriever.m
//  SaleSail
//
//  Created by e on 2/14/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_JsonDataRetriever.h"
#import "AFNetworking.h"

@implementation SS_JsonDataRetriever

@synthesize categories, sales;

+ (SS_JsonDataRetriever *)sharedInstance
{
    static SS_JsonDataRetriever *sharedSingleton;
    
    @synchronized(self)
    {
        if (!sharedSingleton)
            sharedSingleton = [[SS_JsonDataRetriever alloc] init];
        
        return sharedSingleton;
    }
}

- (id) init {
    self = [super init];
    if (self) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSInteger serverPreference = [defaults integerForKey:@"server_preference"];
        NSLog(@"serverPreference: %d", serverPreference);
        if (serverPreference == 0) {
            echoUrl = @"http://192.168.1.2:8080/mobile/";
        } else {
            //this has to be changed for the production server
            echoUrl = @"http://192.168.77.146:8080/mobile/";
        }
    }
    return self;
}

- (void) loadCategoriesFromServer {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", echoUrl, @"categories/"]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"GET"];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest
                                            success:^(NSURLRequest *urlRequest, NSHTTPURLResponse *response, id JSON) {
                                                NSLog(@"%@",JSON);
                                                NSLog(@"set categories success");
                                                NSLog(@"%@", JSON);
                                                [self setCategories: (NSArray *) JSON];
                                                [[NSNotificationCenter defaultCenter] postNotificationName:@"CATEGORIES_LOADED" object:nil userInfo:nil];
                                            }
                                            failure:^(NSURLRequest *urlRequest, NSURLResponse *response, NSError *error, id json) {
                                                NSLog(@"%@", error);
                                            }];    
    [operation start];    
}

- (void) loadSeachSalesFromServer: (NSString*) forCategories {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", echoUrl, @"sales/"]];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setHTTPMethod:@"POST"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger distance = [defaults integerForKey:@"distance_around_you"];
    NSInteger measureUnit = [defaults integerForKey:@"distance_measured_in"];
    NSString *measureUnitSt = [self getMeasureUnit:measureUnit];
    
    NSString *postString = [NSString stringWithFormat:@"categoryIds=%@&distance=%d&measureUnit=%@&latitude=46.755539&longitude=22.237499", forCategories, distance, measureUnitSt];
    NSLog(@"post: %@", postString);
//    NSString *postString = @"categoryIds=1,2,3,4&distance=150&measureUnit=km&latitude=46.755539&longitude=22.237499";
    [urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:urlRequest
                                            success:^(NSURLRequest *urlRequest, NSHTTPURLResponse *response, id JSON) {
                                                NSLog(@"%@",JSON);
                                                NSLog(@"loadSeachSalesFromServer success");
                                                [self setSales: (NSArray *) JSON];
                                                [[NSNotificationCenter defaultCenter] postNotificationName:@"SALES_LOADED" object:nil userInfo:nil];
                                            }
                                            failure:^(NSURLRequest *urlRequest, NSURLResponse *response, NSError *error, id json) {
                                                NSLog(@"%@", error);
                                            }];    
    [operation start];
}

-(NSString*) getMeasureUnit: (NSInteger) measureUnit {
    if (measureUnit == 1) {
        return @"miles";
    } else {
        return @"km";
    }
}

@end
