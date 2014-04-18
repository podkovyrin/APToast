//
//  UIView+APToastStyle.m
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import "UIView+APToastStyle.h"

@implementation UIView (APToastStyle)

+ (CGFloat)ap_toastMaxHeightPercent {
    return 0.8f; // 80% of parent view height
}

+ (CGFloat)ap_toastHorizontalPadding {
    return 6.f;
}

+ (CGFloat)ap_toastVerticalPadding {
    return 6.f;
}

+ (CGFloat)ap_toastMinHeight {
    return 40.f;
}

+ (CGFloat)ap_toastCornerRadius {
    return 3.f;
}

+ (CGFloat)ap_toastOpacity {
    return 0.8f;
}

+ (UIFont *)ap_toastFont {
    return [UIFont systemFontOfSize:16.f];
}

+ (NSInteger)ap_toastMaxNumberOfLines {
    return 2;
}

+ (NSTimeInterval)ap_toastDuration {
    return 2.f;
}

+ (BOOL)ap_toastTapToComplete {
    return YES;
}

@end
