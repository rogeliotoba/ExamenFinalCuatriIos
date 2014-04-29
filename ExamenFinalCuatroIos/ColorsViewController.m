//
//  ColorsViewController.m
//  ExamenFinalCuatroIos
//
//  Created by Rogelio Torres on 28/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import "ColorsViewController.h"

@interface ColorsViewController ()

@end

@implementation ColorsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderBlueChanged:(id)sender {
    self.finalImage.backgroundColor = [UIColor colorWithRed:self.sliderRed.value/255 green:self.sliderGreen.value/255 blue:self.sliderBlue.value/255 alpha:1];
    self.lblBlueValue.text = [[NSString alloc] initWithFormat:@"%f",self.sliderBlue.value];
}


- (IBAction)sliderRedChanged:(id)sender {
    self.finalImage.backgroundColor = [UIColor colorWithRed:self.sliderRed.value/255 green:self.sliderGreen.value/255 blue:self.sliderBlue.value/255 alpha:1];
    self.lblRedValue.text = [[NSString alloc] initWithFormat:@"%f",self.sliderRed.value];
}

- (IBAction)sliderGreenChanged:(id)sender {
        self.finalImage.backgroundColor = [UIColor colorWithRed:self.sliderRed.value/255 green:self.sliderGreen.value/255 blue:self.sliderBlue.value/255 alpha:1];
    self.lblGreenValue.text = [[NSString alloc] initWithFormat:@"%f",self.sliderGreen.value];
}

@end
