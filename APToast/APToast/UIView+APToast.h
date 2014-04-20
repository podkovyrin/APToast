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

/**
 *  This category adds methods to the `UIView` class. The methods in this category provide ability for making toast-like notifications.
 */
@interface UIView (APToast)

///------------------------------------------------
/// @name Make text toast
///------------------------------------------------

/**
 *  Make simple toast with `toastText` with default position and duration.
 *
 *  @param toastText  The toast text
 *  @param duration   Toasting `duration`
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToast:(NSString *)toastText;

/**
 *  Make simple toast with `toastText` with default position.
 *
 *  @param toastText  The toast text
 *  @param duration   Toasting `duration`
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration;

/**
 *  Make simple toast with `toastText`.
 *
 *  @param toastText  The toast text
 *  @param duration   Toasting `duration`
 *  @param position   Toast position on receiver view
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration position:(APToastPosition)position;

/**
 *  Make simple toast with `toastText`.
 *
 *  @param toastText  The toast text
 *  @param duration   Toasting `duration`
 *  @param position   Toast position on receiver view
 *  @param completion The block to execute when toasting completes
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToast:(NSString *)toastText duration:(NSTimeInterval)duration position:(APToastPosition)position completion:(void (^)())completion;

/**
 *  Make simple toast with `toastText`.
 *
 *  @param toastText     The toast text
 *  @param duration      Toasting `duration`
 *  @param center        Center of displaying `toastView`
 *  @param tapToComplete Should eject toast by touching it
 *  @param completion    The block to execute when toasting completes
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToast:(NSString *)toastText
                 duration:(NSTimeInterval)duration
                   center:(CGPoint)center
            tapToComplete:(BOOL)tapToComplete
               completion:(void (^)())completion;

///------------------------------------------------
/// @name Make custom view toast
///------------------------------------------------

/**
 *  Make toast with `toastView` with default position and duration.
 *  `toastView` adds to receiver view as subview with fade in animation.
 *
 *  @param toastView     The view for toasting
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToastView:(UIView *)toastView;

/**
 *  Make toast with `toastView` with default position.
 *  `toastView` adds to receiver view as subview with fade in animation.
 *
 *  @param toastView     The view for toasting
 *  @param duration      Toasting `duration`
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_showToastView:(UIView *)toastView duration:(NSTimeInterval)duration;

/**
 *  Make toast with `toastView`.
 *  `toastView` adds to receiver view as subview with fade in animation.
 *
 *  @param toastView     The view for toasting
 *  @param duration      Toasting `duration`
 *  @param position      Toast position on receiver view
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToastView:(UIView *)toastView duration:(NSTimeInterval)duration position:(APToastPosition)position;

/**
 *  Make toast with `toastView`.
 *  `toastView` adds to receiver view as subview with fade in animation.
 *  `completion` block executes even if toast is forced ejected.
 *
 *  @param toastView     The view for toasting
 *  @param duration      Toasting `duration`
 *  @param center        Center of displaying `toastView`
 *  @param tapToComplete Should eject toast by touching it
 *  @param completion    The block to execute when toasting completes
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting or `NSNotFound` (if toast not queued due to incorrect parameters)
 */
- (NSInteger)ap_makeToastView:(UIView *)toastView
                     duration:(NSTimeInterval)duration
                       center:(CGPoint)center
                tapToComplete:(BOOL)tapToComplete
                   completion:(void (^)())completion;

///------------------------------------------------
/// @name Eject toast
///------------------------------------------------

/**
 *  Animated ejects toast with specified `toastID` (if it exists) from toasting
 */
- (void)ap_ejectToast:(NSInteger)toastID;

/**
 *  Ejects toast with specified `toastID` (if it exists) from toasting.
 */

/**
 *  Ejects toast with specified `toastID` (if it exists) from toasting.
 */
- (void)ap_ejectToast:(NSInteger)toastID animated:(BOOL)animated;

@end
