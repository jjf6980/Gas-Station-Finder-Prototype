//
//  MapPoint.m
//  Gas Station Finder
//
//  Created by Justin on 12/16/14.
//  Copyright (c) 2014 Justin Fogarty. All rights reserved.
//


#import "MapPoint.h"
#import "FirstViewController.h"

@implementation MapPoint
@synthesize name = _name;
@synthesize address = _address;
@synthesize coordinate = _coordinate;
@synthesize price = _price;
@synthesize spendingAmt = _spendingAmt;

-(id)initWithName:(NSString*)name address:(NSString*)address price:(NSString*) price spending:(NSString *)spendingAmt coordinate:(CLLocationCoordinate2D)coordinate  {
    if ((self = [super init])) {
        _name = [name copy];
        _address = [address copy];
        _price = [price copy];
        _spendingAmt = [spendingAmt copy];
        _coordinate = coordinate;
        
    }
    return self;
}

-(NSString *)title {
    if ([_name isKindOfClass:[NSNull class]])
        return @"Unknown charge";
    else{
        
        NSString * titlWthPrice = [NSString stringWithFormat:@"%@ $%@", _name,_price];
        return titlWthPrice;
    }
}

-(NSString *)subtitle {
    NSString *test = _address;
    NSString* full  = [test stringByAppendingString:@" Price:"];
    NSString* complete = [full stringByAppendingString:_price];
    if([_price isEqualToString:@"N/A"]){
        return _price;
    }

    double p = [_price intValue];
   // NSLog(@"%d",p);
    double amt  =[_spendingAmt intValue];
    //NSLog(@"%d",amt);
    float calc = amt/p;
    
    NSString * last = [NSString stringWithFormat:@"You can get %f gallons at ", calc];
    NSString * final = [last stringByAppendingString:complete];

    //return _address;
    return final;
}

@end