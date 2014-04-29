//
//  SeasonsViewController.m
//  ExamenFinalCuatroIos
//
//  Created by Rogelio Torres on 29/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import "SeasonsViewController.h"
#import "SeasonTableViewCell.h"

@interface SeasonsViewController ()

@end

@implementation SeasonsViewController

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
    
    self.seasons = [[NSArray alloc]initWithObjects:@"primavera",@"verano",@"otoño",@"invierno", nil];
    self.seasonsDates = [[NSArray alloc]initWithObjects:@"21/03/2015",@"21/06/2014",@"23/09/2014",@"23/12/2014", nil];
    self.videos = [[NSArray alloc]initWithObjects:@"http://www.youtube.com/embed/ZwEhMUwbcD4", @"http://www.youtube.com/embed/f_pjH2b808w" ,@"http://www.youtube.com/embed/U8v12M2mRVM",@"http://www.youtube.com/embed/cJxTcFFErYg", nil];
    
    //[self embedYouTube:@"https://www.youtube.com/embed/l3Iwh5hqbyE" frame:CGRectMake(20, 20, 200, 400)];
    
    self.detailView.hidden=YES;
    [self hideDetail];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideDetail {
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^
     {
         CGRect screenRect = [[UIScreen mainScreen] bounds];
         CGRect frame = self.detailView.frame;
         frame.origin.y = 0;
         frame.origin.x = (-screenRect.size.width);
         self.detailView.frame = frame;
     }
                     completion:^(BOOL finished)
     {
         self.detailView.hidden=YES;
     }];
}

- (void)showDetail {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^
     {
         self.detailView.hidden=NO;
         CGRect frame = self.detailView.frame;
         frame.origin.y = 0;
         frame.origin.x = 0;
         frame.size.width =screenWidth;
         frame.size.height = screenHeight;
         self.detailView.frame = frame;
     }
                     completion:^(BOOL finished)
     {
         //
     }];
}

- (void)embedYouTube:(NSString *)urlString frame:(CGRect)frame {
    NSString *embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: white;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <iframe id=\"yt\" src=\"%@\" \
    width=\"%0.0f\" height=\"%0.0f\"></iframe>\
    </body></html>";
    NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
    [videoView loadHTMLString:html baseURL:nil];
    [self.detailView addSubview:videoView];

}

- (IBAction)btnViewSeasons:(id)sender {
    [self hideDetail];
}

/**********************************************************************************************
 Table Functions
 **********************************************************************************************/
#pragma mark -
#pragma mark Table View Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SeasonCell";
    
    SeasonTableViewCell *cell = (SeasonTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[SeasonTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    cell.lblSeasonName.text =self.seasons[indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentSeason = self.seasons[indexPath.row];
    //clean the view
    for (UIView *aView in [self.detailView subviews]){
        if ([aView isKindOfClass:[UIWebView class]]){
            [aView removeFromSuperview];
        }
    }
    //Add the new things
    [self embedYouTube:self.videos[indexPath.row] frame:CGRectMake(20, 60, 270, 300)];
    
    NSString *genero = @"el";
    if([self.currentSeason isEqual:@"primavera"])
    {
        genero = @"la";
    }
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"dd/MM/yyyy"];
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [f dateFromString:self.seasonsDates[indexPath.row]];
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    
    self.lblDays.text = [[NSString alloc]initWithFormat:@"Faltan %i dias para %@ %@",[components day],genero,self.currentSeason];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [self.locationManager startUpdatingLocation];
    
    float latitude = self.locationManager.location.coordinate.latitude;
    float longitude = self.locationManager.location.coordinate.latitude;
    
    NSString *stringUrl = [[NSString alloc]initWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f",latitude,longitude];
    NSURL *url = [[NSURL alloc]initWithString:stringUrl];
    NSStringEncoding *encoding;
    NSString *jsonResponse = [[NSString alloc] initWithContentsOfURL:url encoding:&encoding error:nil];
    
    NSLog(jsonResponse);
    NSLog(stringUrl);
    
    self.lblTemperature.text = @"30 ºC";
    
    [self showDetail];
}

@end
