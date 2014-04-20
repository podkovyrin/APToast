# APToast

## A UIView category to provide rich toast notifications.

APToast can display one or more toast notifications queued one by one. Toasts can be `NSString` objects or custom `UIView` class. After creating toast can be manually ejected.

<img src="https://raw.github.com/podkovyrin/APToast/master/demo.gif" alt="APToast" title="APToast demo" style="display:block; margin: 10px auto 30px auto; align:center"/>

## Features
 - Tap on toast to dismiss
 - Custom view as toast
 - Queueing toasts one by one
 - Dismiss toast by toastID
 - Present in bottom, top or center of receiver view
 - Present in `CGPoint`-center of receiver view
 - Customizable UI (globally)
 - Device rotation not supported (by now ;))
 

## Usage
 - **[CocoaPods](http://cocoapods.org):**
```
pod 'APToast'
```
 - **Manual:**
Copy `APToast/APToast` folder anywhere to your project and add it to XCode.

##Sample

```obj-c
#import <APToast/UIView+APToast.h>

// make toast
NSInteger toastID = [self.view ap_makeToast:@"Simple toast message"];
// eject later if needed:
[self.view ap_ejectToast:toastID];


// custom toast view
UIView *customToastView = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 280, 44)];
customToastView.backgroundColor = [UIColor greenColor];

[self.view ap_makeToastView:customToastView duration:4.f position:APToastPositionCenter];
```

For advanced used see `APToastExampleViewController`. Other parameters is described in `UIView+APToast.h`.

## Compatibility
iOS 6.0 or later.

## Notes
Inspired by https://github.com/scalessec/Toast and https://github.com/intuit/LocationManager

## License

APToast is available under the MIT license.

Copyright © 2014 Andrew Podkovyrin

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
