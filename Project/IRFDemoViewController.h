//
//  IRFDemoViewController.h
//  IRFNavigationKit
//
//  Created by Fabio Pelosin on 15/11/13.
//  Copyright (c) 2013 Fabio Pelosin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "IRFNavigationKit.h"

@interface IRFDemoViewController : NSViewController <IRFNavigationKit>

@property NSUInteger index;

@property (weak) IBOutlet NSImageView *imageView;
@property (weak) IBOutlet NSTextField *textLabel;

@end
