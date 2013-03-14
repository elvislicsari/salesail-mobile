#import "SS_CalloutMapAnnotation.h"

@interface SS_CalloutMapAnnotation()


@end

@implementation SS_CalloutMapAnnotation

@synthesize latitude = _latitude;
@synthesize longitude = _longitude;

- (id)initWithLatitude:(CLLocationDegrees)latitude
		  andLongitude:(CLLocationDegrees)longitude {
	if (self = [super init]) {
		self.latitude = latitude;
		self.longitude = longitude;
	}
	return self;
}

- (CLLocationCoordinate2D)coordinate {
	CLLocationCoordinate2D coordinate;
	coordinate.latitude = self.latitude;
	coordinate.longitude = self.longitude;
	return coordinate;
}

@end
