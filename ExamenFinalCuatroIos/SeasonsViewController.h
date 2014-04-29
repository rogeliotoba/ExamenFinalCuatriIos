//
//  SeasonsViewController.h
//  ExamenFinalCuatroIos
//
//  Created by Rogelio Torres on 29/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SeasonsViewController : UIViewController
{
    NSString *_currentSeason;
    NSArray *_seasons;
    NSArray *_seasonsDates;
    NSArray *_videos;
    CLLocationManager *_locationManager;
}
@property (nonatomic,strong) NSString *currentSeason;
@property (nonatomic,strong) NSArray *seasons;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (nonatomic,strong) NSArray *seasonsDates;
@property (nonatomic,strong) NSArray *videos;
- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame;
- (IBAction)btnViewSeasons:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblDays;
@property (weak, nonatomic) IBOutlet UILabel *lblTemperature;
@property (nonatomic,strong) CLLocationManager *locationManager;
@end
