//
//  APToaster.h
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Toasts manager class
 */
@interface APToaster : NSObject

/**
 *  Returns singleton instance
 */
+ (APToaster *)sharedInstance;

/**
 *  Enqueue `toastView` for toasting or toast it immediately if queue is empty
 *
 *  @param toastView     The view for toasting
 *  @param parentView    The parent view for `toastView`
 *  @param duration      Toasting `duration`
 *  @param tapToComplete Should eject toast by touching it
 *  @param completion    The block to execute when toasting completes or nil
 *
 *  @return Unique auto-generated `toastID`, which can be used to force early completion toasting
 */
- (NSInteger)makeToast:(UIView *)toastView
            parentView:(UIView *)parentView
              duration:(NSTimeInterval)duration
         tapToComplete:(BOOL)tapToComplete
            completion:(void (^)())completion;

/**
 *  Ejects `toastView` from toasting queue with the given `toastID`
 */
- (void)ejectToastWithID:(NSInteger)toastID animated:(BOOL)animated;

///------------------------------------------------
/// @name Global configuration
///------------------------------------------------

/**
 *  Sets show/hide animation duration globally
 */
+ (void)setToasterAnimationDuration:(NSTimeInterval)duration;

@end
