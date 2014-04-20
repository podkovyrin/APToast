//
//  APToast.h
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APToastDelegate;

/**
 *  Toast object, created and managed by `APToaster`
 */
@interface APToast : NSObject

/**
 *  Unique (per app launch), auto-generated toast ID
 */
@property (assign, readonly, nonatomic) NSInteger toastID;
/**
 *  Toasting duration
 */
@property (assign, readwrite, nonatomic) NSTimeInterval duration;
/**
 *  Should eject toast by touching it
 */
@property (assign, readwrite, nonatomic) BOOL tapToComplete;
/**
 *  The view for toasting
 */
@property (strong, readwrite, nonatomic) UIView *toastView;
/**
 *  The parent view for toastView (via addSubview:)
 */
@property (weak, readwrite, nonatomic) UIView *parentView;
/**
 *  The delegate for toast object
 */
@property (weak, readwrite, nonatomic) id<APToastDelegate> delegate;
/**
 *  The block to execute when toasting completes
 */
@property (copy, readwrite, nonatomic) void (^completionBlock)();

/**
 *  Starts toasting timer
 */
- (void)startTimer;

/**
 *  Adds tap gesture recognizer on toastView
 */
- (void)addTapToCompleteIfNeeded;

/**
 *  Stops toasting timer and removes tap gesture recognizer, if set
 */
- (void)stopToasting;

/**
 *  Returns a Boolean value that indicates whether the toast currently toasting
 */
- (BOOL)isActive;

/**
 *  Returns a Boolean value that indicates whether the toast is started
 */
- (BOOL)isStarted;

@end

/**
 *  Protocol for the APToast to notify delegate that toast must be ejected
 */
@protocol APToastDelegate <NSObject>

@required
/**
 *  Notification that APToast object must be ejected
 *
 *  @param toast toast to eject
 */
- (void)toastDidFinished:(APToast *)toast;

@end
