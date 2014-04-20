//
//  APToast.m
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import "APToast.h"


@interface APToast ()

@property (assign, readwrite, nonatomic) NSInteger toastID;
@property (strong, readwrite, nonatomic) NSTimer *timeoutTimer;
@property (strong, readwrite, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end


@implementation APToast

#pragma mark - ID

static NSInteger _nextToastID = 0;

+ (NSInteger)getNextToastID {
    _nextToastID++;
    return _nextToastID;
}

#pragma mark - NSObject

- (instancetype)init {
    self = [super init];
    if (self) {
        self.toastID = [[self class] getNextToastID];
    }
    return self;
}

- (BOOL)isEqualToToast:(APToast *)toast {
    return self.toastID == toast.toastID;
}

- (BOOL)isEqual:(id)object {
    if (object == self) {
        return YES;
    }
    if (!object || ![object isKindOfClass:[self class]]) {
        return NO;
    }
    return [self isEqualToToast:object];
}

- (NSUInteger)hash {
    return [[NSString stringWithFormat:@"%ld", (long)self.toastID] hash];
}

- (void)dealloc {
    [_timeoutTimer invalidate];
}

#pragma mark - Lifecycle

- (void)startTimer {
    if (self.duration > 0 && !self.timeoutTimer) {
        self.timeoutTimer = [NSTimer scheduledTimerWithTimeInterval:self.duration
                                                             target:self
                                                           selector:@selector(timeoutTimerFired:)
                                                           userInfo:nil
                                                            repeats:NO];
    }
}

- (void)addTapToCompleteIfNeeded {
    if (self.tapToComplete && !self.tapGestureRecognizer) {
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
        [self.toastView addGestureRecognizer:self.tapGestureRecognizer];
        
        self.toastView.userInteractionEnabled = YES;
        self.toastView.exclusiveTouch = YES;
    }
}

- (void)stopToasting {
    [self.timeoutTimer invalidate];
    
    if (self.tapGestureRecognizer) {
        [self.toastView removeGestureRecognizer:self.tapGestureRecognizer];
    }
}

- (BOOL)isActive {
    return [self.timeoutTimer isValid];
}

- (BOOL)isStarted {
    return (self.timeoutTimer != nil);
}

#pragma mark - Events

- (void)timeoutTimerFired:(NSTimer *)timer {
    [self.delegate toastDidFinished:self];
}

- (void)tapGestureRecognizerAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self.timeoutTimer invalidate];
    
    [self.delegate toastDidFinished:self];
}

@end
