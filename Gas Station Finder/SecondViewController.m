//
//  SecondViewController.m
//  Gas Station Finder
//
//  Created by Justin on 12/15/14.
//  Copyright (c) 2014 Justin Fogarty. All rights reserved.
//

//api rfej9napna

//url http://devapi.mygasfeed.com/stations/radius/(Latitude)/(Longitude)/(distance)/(fueltype)/(sortby)/apikey.json?callback=?

#import "SecondViewController.h"
#import "FirstViewController.h"



@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize radius;
@synthesize mpg;
@synthesize spending;

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //custom initialization
    }
    return  self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    self.myMap.delegate = self;
    [self.myMap setShowsUserLocation:YES];
    
    
   // first.miPerGal.text;

    

    
    

    
}



-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //get coords
    CLLocationCoordinate2D myLocation = [userLocation coordinate];
    //zoom region
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(myLocation, 2500, 2500);
    //NSLog(@"park=");
    //show location
    [self.myMap setRegion:zoomRegion animated:YES];
    
    NSString *url = [NSString stringWithFormat:@"http://devapi.mygasfeed.com/stations/radius/%f/%f/%@/reg/(sortby)/%@.json?",myLocation.latitude,myLocation.longitude,self.radius,GAS_STATION_API_KEY ];
    
    NSLog(@"url=%@",url);
    //Formulate the string as a URL object.
    NSURL *gasRequestURL=[NSURL URLWithString:url];
    
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: gasRequestURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });

    
}

-(void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"stations"];
    
    //Write out the data to the console.
    NSLog(@"Google Data: %@", places);
    [self plotPositions:places];
}

-(void)plotPositions:(NSArray *)data {
    // 1 - Remove any existing custom annotations but not the user location blue dot.
    for (id<MKAnnotation> annotation in self.myMap.annotations) {
        if ([annotation isKindOfClass:[MapPoint class]]) {
            [self.myMap removeAnnotation:annotation];
        }
    }
    // 2 - Loop through the array of places returned from the Google API.
    for (int i=0; i<[data count]; i++) {
        //Retrieve the NSDictionary object in each index of the array.
        NSDictionary* place = [data objectAtIndex:i];
        // 3 - There is a specific NSDictionary object that gives us the location info.
        //NSDictionary *geo = [place objectForKey:@"stations"];
        // Get the lat and long for the location.
        
        // 4 - Get your name and address info for adding to a pin.
        NSString *name=[place objectForKey:@"station"];
        NSString *vicinity=[place objectForKey:@"address"];
        NSString *price = [place objectForKey:@"reg_price"];
        // Create a special variable to hold this coordinate info.
        CLLocationCoordinate2D placeCoord;
        // Set the lat and long
        placeCoord.latitude=[[place objectForKey:@"lat"] doubleValue];
        placeCoord.longitude=[[place objectForKey:@"lng"] doubleValue];
        // 5 - Create a new annotation.
        MapPoint *placeObject = [[MapPoint alloc] initWithName:name address:vicinity price:price spending:self.mpg coordinate:placeCoord];
        [self.myMap addAnnotation:placeObject];
        NSLog(@"%@",price);
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    // Define your reuse identifier.
    static NSString *identifier = @"MapPoint";
    
    if ([annotation isKindOfClass:[MapPoint class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.myMap dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        return annotationView;
    }
    return nil;
}


/*-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
