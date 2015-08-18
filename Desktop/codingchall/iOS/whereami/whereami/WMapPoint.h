//
//  WMapPoint.h
//  whereami
//
//  Created by edward nguyen on 7/29/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface WMapPoint : NSObject <MKAnnotation>
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSDate *timestamp;
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)t stamp:(NSDate*)time;
@end
