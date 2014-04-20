//
//  UIView+APToastStyle.h
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Default text-toast styles
 */
@interface UIView (APToastStyle)

+ (CGFloat)ap_toastMaxHeightPercent;
+ (CGFloat)ap_toastHorizontalPadding;
+ (CGFloat)ap_toastVerticalPadding;
+ (CGFloat)ap_toastMinHeight;
+ (CGFloat)ap_toastCornerRadius;
+ (CGFloat)ap_toastOpacity;
+ (UIFont *)ap_toastFont;
+ (NSInteger)ap_toastMaxNumberOfLines;
+ (NSTimeInterval)ap_toastDuration;
+ (BOOL)ap_toastTapToComplete;

@end
