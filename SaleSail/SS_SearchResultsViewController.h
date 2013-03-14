//
//  SearchResultsController.h
//  SaleSail
//
//  Created by e on 1/12/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "SS_CalloutMapAnnotation.h"
#import "SS_MapAnnotation.h"

@interface SS_SearchResultsViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet MKMapView *worldView;
//    CLLocationManager *locationManager;
    
	MKAnnotationView *_selectedAnnotationView;
	SS_CalloutMapAnnotation *_calloutAnnotation;
    
    BOOL mapAlreadyInitialized;
    NSString* searchByCategoriesIds;
    NSArray* foundSales;
}

//- (void)findLocation;
//- (void)foundLocation:(CLLocation *)loc;
@property (nonatomic, retain) MKAnnotationView *selectedAnnotationView;
@property (nonatomic, retain) NSString *searchByCategoriesIds;

@end
