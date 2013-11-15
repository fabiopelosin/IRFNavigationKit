//
//  IRFDemoViewController.m
//  IRFNavigationKit
//
//  Created by Fabio Pelosin on 15/11/13.
//  Copyright (c) 2013 Fabio Pelosin. All rights reserved.
//

#import "IRFDemoViewController.h"

@interface IRFDemoViewController ()

@end

@implementation IRFDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    NSUInteger imageIndex = self.index;
    if (imageIndex < 1) {
        imageIndex += 5;
    }
    while (imageIndex > 5) {
        imageIndex -= 5;
    }
    NSImage *image = [NSImage imageNamed:[NSString stringWithFormat:@"%ld", imageIndex]];
    [self.imageView setImage:image];

    [self.textLabel setStringValue:[NSString stringWithFormat:@"View Controller %ld", self.index]];
}

- (NSString *)title {
    return [NSString stringWithFormat:@"View %ld", self.index];
}


@end
