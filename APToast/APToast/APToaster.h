//
//  APToaster.h
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APToaster : NSObject

+ (APToaster *)sharedInstance;

///

- (NSInteger)makeToast:(UIView *)toastView
            parentView:(UIView *)parentView
              duration:(NSTimeInterval)duration
         tapToComplete:(BOOL)tapToComplete
            completion:(void (^)())completion;

- (void)ejectToastWithID:(NSInteger)toastID;

///

+ (void)setToasterAnimationDuration:(NSTimeInterval)duration;

@end
