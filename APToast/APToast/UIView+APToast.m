//
//  UIView+APToast.m
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import "UIView+APToast.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+APToastStyle.h"
#import "NSString+APToast.h"
#import "APToaster.h"


@implementation UIView (APToast)

#pragma mark - Text toast

- (NSInteger)ap_makeToast:(NSString *)toastText {
    return [self ap_makeToast:toastText duration:[[self class] ap_toastDuration]];
}

- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration {
    return [self ap_makeToast:toastText duration:duration position:APToastPositionBottom];
}

- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration position:(APToastPosition)position {
    return [self ap_makeToast:toastText duration:duration position:position completion:nil];
}

- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration position:(APToastPosition)position completion:(void (^)())completion {
    if (!toastText.length) {
        return NSNotFound;
    }
    
    UIView *toastView = [self ap_toastViewForText:toastText];
    CGPoint center = [self ap_centerPointForPosition:position toastView:toastView];
    return [self ap_makeToastView:toastView duration:duration center:center tapToComplete:[[self class] ap_toastTapToComplete] completion:completion];
}

- (NSInteger)ap_makeToast:(NSString *)toastText
                 duration:(NSTimeInterval)duration
                   center:(CGPoint)center
            tapToComplete:(BOOL)tapToComplete
               completion:(void (^)())completion {
    if (!toastText.length) {
        return NSNotFound;
    }
    
    UIView *toastView = [self ap_toastViewForText:toastText];
    return [self ap_makeToastView:toastView duration:duration center:center tapToComplete:tapToComplete completion:completion];
}

#pragma mark - View toast

- (NSInteger)ap_makeToastView:(UIView *)toastView {
    return [self ap_showToastView:toastView duration:[[self class] ap_toastDuration]];
}

- (NSInteger)ap_showToastView:(UIView *)toastView duration:(NSTimeInterval)duration {
    return [self ap_makeToastView:toastView duration:duration position:APToastPositionBottom];
}

- (NSInteger)ap_makeToastView:(UIView *)toastView duration:(NSTimeInterval)duration position:(APToastPosition)position {
    CGPoint center = [self ap_centerPointForPosition:position toastView:toastView];
    return [self ap_makeToastView:toastView duration:duration center:center tapToComplete:[[self class] ap_toastTapToComplete] completion:nil];
}

- (NSInteger)ap_makeToastView:(UIView *)toastView
                     duration:(NSTimeInterval)duration
                       center:(CGPoint)center
                tapToComplete:(BOOL)tapToComplete
                   completion:(void (^)())completion {
    if (!toastView) {
        return NSNotFound;
    }
    
    toastView.center = center;
    
    return [[APToaster sharedInstance] makeToast:toastView parentView:self duration:duration tapToComplete:tapToComplete completion:completion];
}

#pragma mark - Eject

- (void)ap_ejectToast:(NSInteger)toastID {
    [self ap_ejectToast:toastID animated:YES];
}

- (void)ap_ejectToast:(NSInteger)toastID animated:(BOOL)animated {
    [[APToaster sharedInstance] ejectToastWithID:toastID animated:animated];
}

#pragma mark - Text toast view

- (UIView *)ap_toastViewForText:(NSString *)toastText {
    UIView *toastView = [[UIView alloc] init];
    toastView.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                  UIViewAutoresizingFlexibleRightMargin |
                                  UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleBottomMargin);
    toastView.layer.cornerRadius = [[self class] ap_toastCornerRadius];
    toastView.backgroundColor = [UIColor colorWithWhite:0.f alpha:[[self class] ap_toastOpacity]];
    
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.numberOfLines = [[self class] ap_toastMaxNumberOfLines];
    textLabel.font = [[self class] ap_toastFont];
    textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.text = toastText;
    [toastView addSubview:textLabel];
    
    CGFloat horizontalPadding = [[self class] ap_toastHorizontalPadding] * 2;
    CGFloat toastViewWidth = CGRectGetWidth(self.bounds) - horizontalPadding;
    CGSize maxTextSize = CGSizeMake(toastViewWidth - horizontalPadding, CGRectGetHeight(self.bounds) * [[self class] ap_toastMaxHeightPercent]);
    CGSize textSize = [textLabel.text ap_toastSizeWithFont:textLabel.font constrainedToSize:maxTextSize lineBreakMode:textLabel.lineBreakMode];
    CGFloat toastViewHeight = MAX(textSize.height + [[self class] ap_toastVerticalPadding] * 2, [[self class] ap_toastMinHeight]);
    
    toastView.frame = CGRectMake(0.f, 0.f, toastViewWidth, toastViewHeight);
    textLabel.frame = toastView.bounds;
    
    return toastView;
}

#pragma mark - Additions

- (CGPoint)ap_centerPointForPosition:(APToastPosition)position toastView:(UIView *)toastView {
    CGFloat padding = [[self class] ap_toastVerticalPadding];
    CGFloat w = CGRectGetWidth(self.bounds);
    CGFloat h = CGRectGetHeight(self.bounds);
    CGFloat toastHeight = CGRectGetHeight(toastView.frame);
    
    switch (position) {
        case APToastPositionBottom:
            return CGPointMake(w / 2.f, h - toastHeight / 2.f - padding);
        case APToastPositionTop:
            return CGPointMake(w / 2.f, toastHeight / 2.f + padding);
        case APToastPositionCenter:
            return CGPointMake(w / 2.f, h / 2.f);
    }
}

@end
