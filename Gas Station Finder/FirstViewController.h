//
//  FirstViewController.h
//  Gas Station Finder
//
//  Created by Justin on 12/15/14.
//  Copyright (c) 2014 Justin Fogarty. All rights reserved.
//
#import "SecondViewController.h"
#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *miPerGal;

@property (strong, nonatomic) IBOutlet UITextField *maxDistance;
@property (strong, nonatomic) IBOutlet UIButton *search;

@property (strong, nonatomic) IBOutlet UITextField *fuelType;


@end
