# APToast

## A UIView category to provide rich toast notifications.

APToast can display one or more toast notifications queued one by one, by providing NSString objects or custom UIView as toast. With the ability to dismiss toast.


## Features
 - Tap to dismiss
 - Custom view as toast
 - Queueing toasts one by one
 - Dismiss toast by toastID
 - Present in bottom, top or center of parent view
 - Present in custom CGPoint
 - Customizable UI
 

## Usage
**Via [CocoaPods](http://cocoapods.org):**
```
pod 'APToast', :git => 'https://github.com/podkovyrin/APToast.git'
```

**Sample:**
```obj-c
#import <APToast/UIView+APToast.h>

[self.view ap_makeToast:@"Test toast message 123" duration:2.5f];

// or
UIView *customToastView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 280, 44)];
customToastView.backgroundColor = [UIColor greenColor];

[self.view ap_makeToastView:customToastView duration:4.f position:APToastPositionCenter];

```


## Compatibility
iOS 6.0 or later.


## Notes

Inspired by https://github.com/scalessec/Toast and https://github.com/intuit/LocationManager


## MIT License

Copyright (c) 2014 Andrew Podkovyrin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
