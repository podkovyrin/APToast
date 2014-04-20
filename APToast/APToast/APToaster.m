//
//  APToaster.m
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import "APToaster.h"
#import "APToast.h"

static NSTimeInterval _apToasterAnimationDuration = 0.2f;

///

@interface APToaster () <APToastDelegate>

@property (strong, readwrite, nonatomic) NSMutableArray *toasts;

@end

///

@implementation APToaster

+ (APToaster *)sharedInstance {
	static dispatch_once_t pred;
	static APToaster *sharedInstance = nil;
	dispatch_once(&pred, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.toasts = [NSMutableArray array];
    }
    return self;
}

#pragma mark -

- (NSInteger)makeToast:(UIView *)toastView
            parentView:(UIView *)parentView
              duration:(NSTimeInterval)duration
         tapToComplete:(BOOL)tapToComplete
            completion:(void (^)())completion {
    APToast *toast = [[APToast alloc] init];
    toast.duration = duration;
    toast.tapToComplete = tapToComplete;
    toast.toastView = toastView;
    toast.parentView = parentView;
    toast.delegate = self;
    toast.completionBlock = completion;
    
    if (!self.toasts.count) {
        // toast queue empty, start it immediately
        //
        [self showToast:toast];
    }
    
    [self.toasts addObject:toast];
    
    return toast.toastID;
}

- (void)ejectToastWithID:(NSInteger)toastID animated:(BOOL)animated {
    // find toast by ID
    //
    APToast *toastToEject = nil;
    for (APToast *toast in self.toasts) {
        if (toast.toastID == toastID) {
            toastToEject = toast;
            break;
        }
    }
    
    if (toastToEject) {
        // check if toast has started
        if ([toastToEject isStarted]) {
            // dismiss toast if its toasting (timer in progress).
            // otherwise toast is hiding now -> do nothing
            //
            if ([toastToEject isActive]) {
                [toastToEject stopToasting];
                [self hideToast:toastToEject animated:animated];
            }
        } else {
            // toast in queue, hide without animation
            [self hideToast:toastToEject animated:NO];
        }
    }
}

#pragma mark - Operations

- (void)showToast:(APToast *)toast {
    if (!toast.parentView) {
        [self.toasts removeObject:toast];
    }
    
    [toast addTapToCompleteIfNeeded];
    
    toast.toastView.alpha = 0.f;
    [toast.parentView addSubview:toast.toastView];
    
    [UIView animateWithDuration:_apToasterAnimationDuration
                          delay:0.f
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         toast.toastView.alpha = 1.f;
                     } completion:^(BOOL finished) {
                         [toast startTimer];
                     }];
}

- (void)hideToast:(APToast *)toast animated:(BOOL)animated {
    [self.toasts removeObject:toast];
    
    void (^hideToastCompletion)(BOOL) = ^(BOOL finished) {
        [toast.toastView removeFromSuperview];
        
        if (toast.completionBlock) {
            toast.completionBlock();
        }
        
        [self showNextToast];
    };
    
    if (animated) {
        [UIView animateWithDuration:_apToasterAnimationDuration
                              delay:0.f
                            options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             toast.toastView.alpha = 0.f;
                         } completion:hideToastCompletion];
    } else {
        hideToastCompletion(NO);
    }
}

- (void)showNextToast {
    if (self.toasts.count) {
        APToast *nextToast = self.toasts.firstObject;
        if (![nextToast isStarted]) {
            [self showToast:nextToast];
        }
    }
}

#pragma mark - APToastDelegate

- (void)toastDidFinished:(APToast *)toast {
    [self hideToast:toast animated:YES];
}

#pragma mark - Constants

+ (void)setToasterAnimationDuration:(NSTimeInterval)duration {
    _apToasterAnimationDuration = duration;
}

@end
