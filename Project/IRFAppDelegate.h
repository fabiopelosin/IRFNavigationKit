//
//  IRFAppDelegate.h
//  Project
//
//  Created by Fabio Pelosin on 15/11/13.
//  Copyright (c) 2013 Fabio Pelosin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface IRFAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSView *contentView;

- (IBAction)nextButtonAction:(id)sender;

@end
