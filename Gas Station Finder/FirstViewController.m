//
//  FirstViewController.m
//  Gas Station Finder
//
//  Created by Justin on 12/15/14.
//  Copyright (c) 2014 Justin Fogarty. All rights reserved.
//

//api rfej9napna

//url http://devapi.mygasfeed.com/stations/radius/(Latitude)/(Longitude)/(distance)/(fueltype)/(sortby)/apikey.json?callback=?

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "MapPoint.h"

@interface FirstViewController ()


@end


@implementation FirstViewController
@synthesize miPerGal = _miPerGal;
@synthesize maxDistance=_maxDistance;
@synthesize fuelType=_fuelType;

- (void)viewDidLoad
{
    [super viewDidLoad];
      //self.miPerGal.text= @"12";
    //NSLog(@"df%@",self.miPerGal.text);
	// Do any additional setup after loading the view, typically from a nib.

   // SecondViewController * test= [[SecondViewController alloc]init];
    
    
    //test.mpg  =_miPerGal.text;
    
    
}

-(IBAction)searchCrit:(id)sender{
    
    //NSString *url = @"d";
    //NSLog(@"=%@",self.miPerGal.text);
   SecondViewController *NVC = [self.storyboard
    instantiateViewControllerWithIdentifier:@"mapView"];
    NVC.mpg = _miPerGal.text;
    NVC.radius = _maxDistance.text;
    
    
    /*
     // scrapped if statements to check fuel type.
    if([_fuelType.text  isEqual: @"regular"]){
        NVC.type = @"reg";
    }
    else if([_fuelType.text  isEqual: @"mid-grade"]){
        NVC.type = @"mid";
    }
    else if([_fuelType.text  isEqual: @"premium"]){
        NVC.type = @"pre";
    }
    else if([_fuelType.text  isEqual: @"diesel"]){
        NVC.type = @"diesel";
    }
    
    */
    [self presentViewController:NVC animated:YES completion:nil];

    //[self.navigationController pushViewController:test animated:YES];
    //[self.miPerGal endEditing:YES];
    
    //NSLog(@"%@",self.miPerGal.text);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
