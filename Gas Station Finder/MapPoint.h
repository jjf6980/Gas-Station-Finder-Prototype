//
//  MapPoint.h
//  Gas Station Finder
//
//  Created by Justin on 12/16/14.
//  Copyright (c) 2014 Justin Fogarty. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>
{
    
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;
    NSString *_spendingAmt;
    
}

@property (copy) NSString *name;
@property (copy) NSString *address;
@property (copy) NSString *price;
@property (copy) NSString *spendingAmt;
//@property (nonatomic) int *intPrice;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;


- (id)initWithName:(NSString*)name address:(NSString*)address price:(NSString*) price spending:(NSString *)spendingAmt coordinate:(CLLocationCoordinate2D)coordinate;

@end