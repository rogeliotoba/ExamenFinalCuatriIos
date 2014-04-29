//
//  BodyViewController.h
//  ExamenFinalCuatroIos
//
//  Created by Rogelio Torres on 29/04/14.
//  Copyright (c) 2014 Rogelio Torres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BodyViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *bodyImage;
- (IBAction)narizClick:(id)sender;
- (IBAction)bocaClick:(id)sender;
- (IBAction)pechoClick:(id)sender;
- (IBAction)manos2Click:(id)sender;
- (IBAction)mano1Click:(id)sender;
- (IBAction)rodilla1Click:(id)sender;
- (IBAction)pies1Click:(id)sender;
- (IBAction)pies2Click:(id)sender;

@end
