//
//  APViewController.m
//  APToast
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import "APViewController.h"

#import "UIView+APToast.h"

@interface APViewController ()

@end

@implementation APViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showToastButton:(UIButton *)sender {

    [self.view ap_makeToast:@"Test toast message 123" duration:2.5f];
}

- (IBAction)showToastButton2:(id)sender {
    UIView *customToastView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 280, 44)];
    customToastView.backgroundColor = [UIColor greenColor];
    
    [self.view ap_makeToastView:customToastView duration:4.f position:APToastPositionCenter];
}

@end
