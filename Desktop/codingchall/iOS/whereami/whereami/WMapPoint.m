//
//  WMapPoint.m
//  whereami
//
//  Created by edward nguyen on 7/29/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "WMapPoint.h"

@implementation WMapPoint
@synthesize coordinate,title,subtitle,timestamp;

-(id)init{
  return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Some Town" stamp:[NSDate date]];
}

//designated initializer
- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)t stamp:(NSDate*)time{
  self = [super init];
  if (self){
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy, hh:mm:ss"];
    coordinate = c; //instance variable set to c. (ivar is _coordinate, but since it is @synthesize'd, the ivar is coordinate.
    [self setTitle:t];
    [self setSubtitle:[dateFormatter stringFromDate:time]];
    [self setTimestamp:time];
  }
  return self;
}

@end
