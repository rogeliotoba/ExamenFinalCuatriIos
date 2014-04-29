//
//  StatesViewController.h
//  ExamenFinalCuatroIos
//
//  Created by Rogelio Torres on 28/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface StatesViewController : UIViewController
{
    NSString *_currentState;
    NSDictionary *_latitudes;
    NSDictionary *_longitudes;
}
- (IBAction)btnJaliscoClick:(id)sender;
- (IBAction)btnChihuahuaClick:(id)sender;
- (IBAction)btnSonoraClick:(id)sender;
- (IBAction)btnDurangoClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *mapViewContainer;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) NSDictionary *latitudes;
@property (nonatomic) NSDictionary *longitudes;
@property (nonatomic,strong) NSString *currentState;
- (IBAction)viewStatesClick:(id)sender;
- (void)showMap;
- (void)hideMap;
- (void)prepareMap;

@end
