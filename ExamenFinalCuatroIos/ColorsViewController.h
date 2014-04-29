//
//  ColorsViewController.h
//  ExamenFinalCuatroIos
//
//  Created by Rogelio Torres on 28/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *redImageView;
@property (weak, nonatomic) IBOutlet UIImageView *greenImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blueImageView;
@property (weak, nonatomic) IBOutlet UISlider *sliderBlue;
@property (weak, nonatomic) IBOutlet UISlider *sliderGreen;
@property (weak, nonatomic) IBOutlet UISlider *sliderRed;
@property (weak, nonatomic) IBOutlet UIImageView *finalImage;
@property (weak, nonatomic) IBOutlet UILabel *lblRedValue;
@property (weak, nonatomic) IBOutlet UILabel *lblGreenValue;
@property (weak, nonatomic) IBOutlet UILabel *lblBlueValue;

- (IBAction)sliderBlueChanged:(id)sender;
- (IBAction)sliderRedChanged:(id)sender;
- (IBAction)sliderGreenChanged:(id)sender;
@end
