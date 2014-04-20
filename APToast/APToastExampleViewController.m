//
//  APToastExampleViewController.m
//
//  Created by Andrew Podkovyrin on 19/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import "APToastExampleViewController.h"
#import "UIView+APToast.h"

#define kTOAST_BUTTONS_COUNT 3

@interface APToastExampleViewController ()

@property (strong, readwrite, nonatomic) NSMutableDictionary *toastIDByIndex;
@property (strong, readwrite, nonatomic) NSMutableArray *dismissButtons;

@end

@implementation APToastExampleViewController

- (void)loadView {
    [super loadView];
        
    self.toastIDByIndex = [NSMutableDictionary dictionary];
    self.dismissButtons = [NSMutableArray array];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGSize s = self.view.bounds.size;
    CGSize b = CGSizeMake(120.f, 44.f);
    CGFloat top = 44.f;
    
    for (int i = 0; i < kTOAST_BUTTONS_COUNT; i++) {
        UIButton *toastButton = [self toastButtonWithIndex:i];
        toastButton.frame = CGRectMake(20.f, top, b.width, b.height);
        [self.view addSubview:toastButton];
        
        UIButton *dismissButton = [self dismissButtonWithIndex:i];
        dismissButton.frame = CGRectMake(s.width - b.width - 20.f, top, b.width, b.height);
        dismissButton.enabled = NO;
        [self.view addSubview:dismissButton];
        [self.dismissButtons addObject:dismissButton];
        
        top += b.height * 2;
    }
}

#pragma mark - Actions

- (void)toastButtonAction:(id)sender {
    UIButton *toastButton = (UIButton *)sender;
    UIButton *dismissButton = self.dismissButtons[toastButton.tag];
    
    __weak __typeof(self) weakSelf = self;
    __weak UIButton *weakToastButton = toastButton;
    __weak UIButton *weakDismissButton = dismissButton;
    
    NSInteger toastID = [self.view ap_makeToast:[toastButton titleForState:UIControlStateNormal]
                                       duration:2.f
                                       position:APToastPositionBottom
                                     completion:^{
                                         __strong __typeof(weakSelf) strongSelf = weakSelf;
                                         if (!strongSelf) {
                                             return;
                                         }

                                         // restore buttons state
                                         // remove this toast id
                                         //
                                         weakToastButton.enabled = YES;
                                         weakDismissButton.enabled = NO;
                                         [strongSelf.toastIDByIndex removeObjectForKey:@(weakToastButton.tag)];
                                     }];
    
    // Don't allow pop another toast by this button, until current in progress
    //
    toastButton.enabled = NO;
    dismissButton.enabled = YES;
    
    // Store toast id
    //
    self.toastIDByIndex[@(toastButton.tag)] = @(toastID);
}

- (void)dismissButtonAction:(id)sender {
    UIButton *dismissButton = (UIButton *)sender;
    dismissButton.enabled = NO;
    
    // Eject toast by id
    // this will execute completion block when toast did hide
    //
    NSInteger toastID = [self.toastIDByIndex[@(dismissButton.tag)] integerValue];
    [self.view ap_ejectToast:toastID animated:(dismissButton.tag != kTOAST_BUTTONS_COUNT - 1)];
}

#pragma mark - Buttons factory

- (UIButton *)toastButtonWithIndex:(NSInteger)index {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [b setTitle:[NSString stringWithFormat:@"Show %ld", (long)index] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(toastButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    b.tag = index;
    return b;
}

- (UIButton *)dismissButtonWithIndex:(NSInteger)index {
    UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [b setTitle:[NSString stringWithFormat:@"Dismiss %ld", (long)index] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(dismissButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    b.tag = index;
    return b;
}

@end
