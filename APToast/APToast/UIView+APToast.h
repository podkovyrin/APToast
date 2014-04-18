//
//  UIView+APToast.h
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, APToastPosition) {
    APToastPositionBottom,
    APToastPositionCenter,
    APToastPositionTop,
};


@interface UIView (APToast)

/// Text toast

/**
 *  Show simple text toast with default position and duration
 *
 *  @param toastText  toast text
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToast:(NSString *)toastText;

/**
 *  Show simple text toast with default position
 *
 *  @param toastText  toast text
 *  @param duration   showing duration
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration;

/**
 *  Show simple text toast
 *
 *  @param toastText  toast text
 *  @param duration   showing duration
 *  @param position   toast position on parent view
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration position:(APToastPosition)position;

/**
 *  Show simple text toast
 *
 *  @param toastText  toast text
 *  @param duration   showing duration
 *  @param position   toast position on parent view
 *  @param completion block to execute when toast did hide
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration position:(APToastPosition)position completion:(void (^)())completion;

/**
 *  Show simple text toast
 *
 *  @param toastText     toast text
 *  @param duration      showing duration
 *  @param center        center of displaying toast view
 *  @param tapToComplete should hide toast by tap
 *  @param completion    block to execute when toast did hide
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToast:(NSString *)toastText
                 duration:(NSTimeInterval)duration
                   center:(CGPoint)center
            tapToComplete:(BOOL)tapToComplete
               completion:(void (^)())completion;

/// View toast

/**
 *  Show view as toast with default position and duration
 *
 *  @param toastView     toast view to show
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToastView:(UIView *)toastView;

/**
 *  Show view as toast with default position
 *
 *  @param toastView     toast view to show
 *  @param duration      showing duration
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_showToastView:(UIView *)toastView duration:(NSTimeInterval)duration;

/**
 *  Show view as toast
 *
 *  @param toastView     toast view to show
 *  @param duration      showing duration
 *  @param position      toast position on parent view
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToastView:(UIView *)toastView duration:(NSTimeInterval)duration position:(APToastPosition)position;

/**
 *  Show view as toast
 *
 *  @param toastView     toast view to show
 *  @param duration      showing duration
 *  @param center        center of displaying toast view
 *  @param tapToComplete should hide toast by tap
 *  @param completion    block to execute when toast did hide
 *
 *  @return unique toastID or NSNotFound
 */
- (NSInteger)ap_makeToastView:(UIView *)toastView
                     duration:(NSTimeInterval)duration
                       center:(CGPoint)center
                tapToComplete:(BOOL)tapToComplete
                   completion:(void (^)())completion;

/// Eject

/**
 *  Hide toast by toastID
 *
 *  @param toastID
 */
- (void)ap_ejectToast:(NSInteger)toastID;

@end
