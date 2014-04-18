//
//  APToast.h
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APToastDelegate;

///

@interface APToast : NSObject

@property (assign, readonly, nonatomic) NSInteger toastID;
@property (assign, readwrite, nonatomic) NSTimeInterval duration;
@property (assign, readwrite, nonatomic) BOOL tapToComplete;
@property (strong, readwrite, nonatomic) UIView *toastView;
@property (weak, readwrite, nonatomic) UIView *parentView;
@property (weak, readwrite, nonatomic) id<APToastDelegate> delegate;
@property (copy, readwrite, nonatomic) void (^completionBlock)();

- (void)startTimer;

- (void)addTapToCompleteIfNeeded;

- (void)stopToasting;

@end

///

@protocol APToastDelegate <NSObject>

@required
- (void)toastDidFinished:(APToast *)toast;

@end
