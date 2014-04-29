//
//  StatesViewController.m
//  ExamenFinalCuatroIos
//
//  Created by Rogelio Torres on 28/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import "StatesViewController.h"

@interface StatesViewController ()

@end

@implementation StatesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapViewContainer.hidden = YES;
    [self hideMap];
    
    self.latitudes = [[NSDictionary alloc] initWithObjectsAndKeys:@"20.661907",@"jalisco",@"28.6657928",@"chihuahua",@"29.0748695",@"sonora",@"25.5679854",@"durango",nil];
    self.longitudes = [[NSDictionary alloc] initWithObjectsAndKeys:@"-103.350863",@"jalisco",@"-106.0641978",@"chihuahua",@"-110.9340399",@"sonora", @"-103.4983974",@"durango", nil];
    
    //Enable the map to get the location
    self.mapView.showsUserLocation = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnJaliscoClick:(id)sender {
    self.currentState = @"jalisco";
    [self prepareMap];
    [self showMap];
}

- (IBAction)btnChihuahuaClick:(id)sender {
    self.currentState = @"chihuahua";
    [self prepareMap];
    [self showMap];
}

- (IBAction)btnSonoraClick:(id)sender {
    self.currentState = @"sonora";
    [self prepareMap];
    [self showMap];
}

- (IBAction)btnDurangoClick:(id)sender {
    self.currentState = @"durango";
    [self prepareMap];
    [self showMap];
}

- (IBAction)viewStatesClick:(id)sender {
    [self hideMap];
}

- (void)hideMap {
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^
     {
         CGRect screenRect = [[UIScreen mainScreen] bounds];
         CGRect frame = self.mapViewContainer.frame;
         frame.origin.y = 0;
         frame.origin.x = (-screenRect.size.width);
         self.mapViewContainer.frame = frame;
     }
                     completion:^(BOOL finished)
     {
         self.mapViewContainer.hidden=YES;
     }];
}

- (void)showMap {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^
     {
         self.mapViewContainer.hidden=NO;
         CGRect frame = self.mapViewContainer.frame;
         frame.origin.y = 0;
         frame.origin.x = 0;
         frame.size.width =screenWidth;
         frame.size.height = screenHeight;
         self.mapViewContainer.frame = frame;
     }
                     completion:^(BOOL finished)
     {
         //
     }];
}

-(void)prepareMap{
    CLLocation *userLocation = [[CLLocation alloc]
                                initWithLatitude:self.mapView.userLocation.coordinate.latitude
                                longitude:self.mapView.userLocation.coordinate.longitude];
    NSMutableArray *pins = [[NSMutableArray alloc] initWithArray:[self.mapView annotations]];
    if ( userLocation != nil ) {
        [pins removeObject:userLocation]; // avoid removing user location off the map
    }
    
    [self.mapView removeAnnotations:pins];
    pins = nil;
    
    
    CLLocationCoordinate2D location = {[[self.latitudes objectForKey:self.currentState] doubleValue], [[self.longitudes objectForKey:self.currentState] doubleValue]};
    
    CLLocation *pinLocation = [[CLLocation alloc]initWithLatitude:location.latitude longitude:location.longitude];
    CLLocationDistance distance = [userLocation distanceFromLocation:pinLocation];

    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];

    point.title = [[NSString alloc]initWithFormat:@"%@ - %f",self.currentState,distance];
    point.coordinate = location;
    [self.mapView addAnnotation:point];
    
    NSLog(@"current location %f",userLocation.coordinate.longitude);
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location, 10000, 10000);
    [self.mapView setRegion:viewRegion animated:YES];

}
@end
