//
//  ViewController.h
//  whereami
//
//  Created by edward nguyen on 7/9/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "WMapPoint.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

//introduction to delegates and protocols. this class must implement the cllocationmanagerdelegate protocol
@interface ViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate,UITextFieldDelegate>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,strong)    CLLocationManager *locationManager;
@property (nonatomic,strong) IBOutlet MKMapView *worldView;
@property (nonatomic,strong) IBOutlet UITextField *locationTitleField;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic) MKCoordinateRegion region;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong,nonatomic) UIAlertView *alert;
@property (strong, nonatomic) IBOutlet UIButton *removePin;
@property (strong, nonatomic) WMapPoint *currentMapPoint;

-(void) findLocation;
-(void) foundLocation:(CLLocation *)loc;

- (IBAction)segmentedAction:(id)sender;

@end

