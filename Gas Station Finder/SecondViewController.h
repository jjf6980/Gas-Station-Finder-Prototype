//
//  SecondViewController.h
//  Gas Station Finder
//
//  Created by Justin on 12/15/14.
//  Copyright (c) 2014 Justin Fogarty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FirstViewController.h"
#import "MapPoint.h"

#define GAS_STATION_API_KEY @"rfej9napna"
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//#import <CoreLocation/CoreLocation.h>

@interface SecondViewController : UIViewController<MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *myMap;

@property (strong,nonatomic)NSString * urlRequest;
@property(strong, nonatomic)NSString * mpg;
@property(strong,nonatomic)NSString* radius;
@property(strong, nonatomic)NSString* spending;



-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;




@end
