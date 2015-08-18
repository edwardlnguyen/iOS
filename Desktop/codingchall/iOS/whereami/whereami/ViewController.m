//
//  ViewController.m
//  whereami
//
//  Created by edward nguyen on 7/9/15.
//  Copyright (c) 2015 edward nguyen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locationManager,worldView,locationTitleField,activityIndicator,region,coordinate,segmentedControl,alert,removePin,currentMapPoint;


//handle location manager messages delegate
- (void) locationManager:(CLLocationManager*)manager
     didUpdateToLocation:(CLLocation *)newLocation
            fromLocation:(CLLocation *)oldLocation {
  NSLog(@"%@",newLocation);
  NSTimeInterval time = [[newLocation timestamp] timeIntervalSinceNow];
  //CLLocationmanager returns the last found location of the device first, so we want to ignore this data. 3 minutes of wait time should be enough to ignore it.
  if (time < -180) {
    //unwanted location data
    return;
  }
  [self foundLocation:newLocation];
}
- (void) locationManager:(CLLocationManager*)manager
        didFailWithError:(NSError *)error{
  NSLog(@"Couldn't find location: %@",error);
}

//handle messages from mapview delegate. map view knows how to use core location to find the location using showsUserLocation property of an MKMapView, and setting it to Yes
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
  CLLocationCoordinate2D loc = [userLocation coordinate];
  self.region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
  [self.worldView setRegion:self.region animated:YES];
  [activityIndicator stopAnimating];
}
-(void) mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
  if ([[view annotation] isKindOfClass:[MKUserLocation class]]) {
    return;
  }
  //set current view.annotation
  [self setCurrentMapPoint:view.annotation];
  //unhide button for annotation removal
  [removePin setHidden:NO];
}
-(void) mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view{
  if ([[view annotation] isKindOfClass:[MKUserLocation class]]) {
    return;
  }
  //remove current view.annotation
  [self setCurrentMapPoint:nil];
  //hide button for annotation removal
  [removePin setHidden:YES];
}

//handle messages from textfield delegate
//returns when the "done" button is pressed on the textfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  if (![[textField text] isEqualToString:@""]) {
    [self findLocation];
  }else{
    [self.alert show];
  }
  [textField resignFirstResponder];
  return YES;
}

-(void)findLocation{
  [self.locationManager startUpdatingLocation];
  [self.activityIndicator startAnimating];
  [self.locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc{
  CLLocationCoordinate2D crd = [loc coordinate];
  WMapPoint *mp = [[WMapPoint alloc]initWithCoordinate:crd title:[self.locationTitleField text] stamp:[NSDate date]];
  [self.worldView addAnnotation:mp];
  self.region = MKCoordinateRegionMakeWithDistance(crd, 250, 250);
  [self.worldView setRegion:self.region animated:YES];
  [self.locationTitleField setText:@""];
  [activityIndicator stopAnimating];
  [locationTitleField setHidden:NO];
  [locationManager stopUpdatingLocation];
}

- (IBAction)segmentedAction:(id)sender {
  [self.activityIndicator startAnimating];
  long index = [self.segmentedControl selectedSegmentIndex];
  if (index == 0) {
    //simple map
    [self.worldView setMapType:MKMapTypeStandard];
  }else if(index == 1){
    //hybrid map
    [self.worldView setMapType:MKMapTypeHybrid];
  }else if(index == 2){
    //satellite map
    [self.worldView setMapType:MKMapTypeSatellite];
  }
  [self.activityIndicator stopAnimating];
}

- (IBAction)removePinAction:(id)sender {
  [self.worldView removeAnnotation:self.currentMapPoint];
  [self setCurrentMapPoint:nil];
}

//nibs and views
- (void)awakeFromNib{
  self.locationManager = [[CLLocationManager alloc]init];
  [self.locationManager requestAlwaysAuthorization];
  [self.locationManager requestWhenInUseAuthorization];
  [self.locationManager setDelegate:self];
  [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
  self.alert = [[UIAlertView alloc]initWithTitle:@"Opps!" message:@"Please enter a name for the pin you want to drop" delegate:nil cancelButtonTitle:@"Cool, Thanks!" otherButtonTitles:nil];
}

-(void)viewDidLoad{
  [self.worldView setMapType:MKMapTypeStandard];
  [self.worldView setShowsUserLocation:YES];
}

//template method. doesn't get called unless absolutely necessary
- (void)dealloc{
  [self.locationManager setDelegate:nil];
}


@end
