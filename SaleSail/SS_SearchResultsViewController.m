//
//  SearchResultsController.m
//  SaleSail
//
//  Created by e on 1/12/13.
//  Copyright (c) 2013 elvis. All rights reserved.
//

#import "SS_SearchResultsViewController.h"
#import "SS_MapAnnotation.h"
#import "SS_InactiveMapAnnotation.h"
#import "SS_ActiveMapAnnotation.h"
#import "SS_CalloutMapAnnotation.h"
#import "SS_CalloutMapAnnotationView.h"
#import "SS_SearchResultsListViewController.h"
#import "SS_JsonDataRetriever.h"

@interface SS_SearchResultsViewController()

@property (nonatomic, retain) SS_CalloutMapAnnotation *calloutAnnotation;

@end

@implementation SS_SearchResultsViewController

@synthesize selectedAnnotationView = _selectedAnnotationView;
@synthesize calloutAnnotation = _calloutAnnotation;
@synthesize searchByCategoriesIds = _searchByCategoriesIds;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        locationManager = [[CLLocationManager alloc] init];
//        [locationManager setDelegate:self];
//        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize
                                target:self
                                action:@selector(showAllResults)];
        [[self navigationItem] setRightBarButtonItem:bbi];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Search Results";
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStyleBordered
                                    target:nil
                                    action:nil];
    [worldView setShowsUserLocation:YES];
    [worldView setMapType:MKMapTypeStandard];//MKMapTypeSatellite, MKMapTypeHybrid
    mapAlreadyInitialized = NO;
    
    [[SS_JsonDataRetriever sharedInstance] loadSeachSalesFromServer: [self searchByCategoriesIds]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillAppear:) name:@"SALES_LOADED" object:nil];
    
    
}

-(void) viewWillAppear:(BOOL)animated {
    [self addMapPointsToMap];
    
    foundSales = [[SS_JsonDataRetriever sharedInstance] sales];
}

- (void) addMapPointsToMap
{
    NSLog(@"addMapPointsToMap");
    NSArray* mapPoints = [self getFoundMapPoints];
    for (SS_MapAnnotation *point in mapPoints) {
        [worldView addAnnotation:point];
    }    
}

- (NSArray*) getFoundMapPoints
{
    NSMutableArray* mapPoints = [[NSMutableArray alloc] init];
    
//    SS_InactiveMapAnnotation* inactive1= [[SS_InactiveMapAnnotation alloc] initWithLatitude:45.755539 andLongitude:21.237499];
//    inactive1.title = @"inactive map annotation";
//    
//    SS_ActiveMapAnnotation* active1 = [[SS_ActiveMapAnnotation alloc] initWithLatitude:45.768481 andLongitude:21.219406];
//    active1.title = @"active map annotation";
//    
//    [mapPoints addObject:inactive1];
//    [mapPoints addObject:active1];
    
    return mapPoints;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
  
    if ([view.annotation isKindOfClass:[SS_ActiveMapAnnotation class]]) {
		if (self.calloutAnnotation == nil) {
			self.calloutAnnotation = [[SS_CalloutMapAnnotation alloc] initWithLatitude:view.annotation.coordinate.latitude
																	   andLongitude:view.annotation.coordinate.longitude];
		} else {
			self.calloutAnnotation.latitude = view.annotation.coordinate.latitude;
			self.calloutAnnotation.longitude = view.annotation.coordinate.longitude;
		}
		[worldView addAnnotation:self.calloutAnnotation];
		self.selectedAnnotationView = view;
	}
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
	if (self.calloutAnnotation && [view.annotation isKindOfClass:[SS_ActiveMapAnnotation class]]) {
		[worldView removeAnnotation: self.calloutAnnotation];
	}
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    NSLog(@"%@", annotation);
    
    if ([annotation isKindOfClass:[SS_CalloutMapAnnotation class]]) {
		SS_CalloutMapAnnotationView *calloutMapAnnotationView = (SS_CalloutMapAnnotationView *)[worldView dequeueReusableAnnotationViewWithIdentifier:@"CalloutAnnotation"];
		if (!calloutMapAnnotationView) {
			calloutMapAnnotationView = [[SS_CalloutMapAnnotationView alloc] initWithAnnotation:annotation
																			 reuseIdentifier:@"CalloutAnnotation"];
			calloutMapAnnotationView.contentHeight = 78.0f;
			UIImage *asynchronyLogo = [UIImage imageNamed:@"asynchrony-logo-small.png"];
			UIImageView *asynchronyLogoView = [[UIImageView alloc] initWithImage:asynchronyLogo];
			asynchronyLogoView.frame = CGRectMake(5, 2, asynchronyLogoView.frame.size.width, asynchronyLogoView.frame.size.height);
			[calloutMapAnnotationView.contentView addSubview:asynchronyLogoView];
		}
		calloutMapAnnotationView.parentAnnotationView = self.selectedAnnotationView;
		calloutMapAnnotationView.mapView = worldView;
		return calloutMapAnnotationView;
	} else if ([annotation isKindOfClass:[SS_ActiveMapAnnotation class]]) {
		MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
																			   reuseIdentifier:@"ActiveAnnotation"];
		annotationView.canShowCallout = NO;
		annotationView.image = [UIImage imageNamed:@"first.png"];
		return annotationView;
	} else if ([annotation isKindOfClass:[SS_InactiveMapAnnotation class]]) {
		MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                                              reuseIdentifier:@"InactiveAnnotation"];
		annotationView.canShowCallout = NO;
		annotationView.image = [UIImage imageNamed:@"second.png"];
		return annotationView;
	}
	
	
	return nil;
}

- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)u
{
    if (mapAlreadyInitialized) {
        return;
    }
    
    mapAlreadyInitialized = YES;
    CLLocationCoordinate2D loc = [u coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 100, 100);
    [worldView setRegion:region animated:YES];
}

-(void) showAllResults
{
    SS_SearchResultsListViewController *rlc = [[SS_SearchResultsListViewController alloc] init];
    [rlc setFoundSales:foundSales];
    [[self navigationController] pushViewController:rlc animated:YES];
    
}

- (void)dealloc
{
    // Tell the location manager to stop sending us messages
//    [locationManager setDelegate:nil];
}

@end
