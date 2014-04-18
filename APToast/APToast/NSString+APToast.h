//
//  NSString+APToast.h
//
//  Created by Andrew Podkovyrin on 18/04/14.
//  Copyright (c) 2014 Andrew Podkovyrin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (APToast)

- (CGSize)ap_toastSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)maxSize lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
