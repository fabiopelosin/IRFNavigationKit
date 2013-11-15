//
//  IRFAppDelegate.m
//  Project
//
//  Created by Fabio Pelosin on 15/11/13.
//  Copyright (c) 2013 Fabio Pelosin. All rights reserved.
//

#import "IRFAppDelegate.h"
#import "IRFNavigationKit.h"
#import "IRFDemoViewController.h"
#import "IRFDemoAnimator.h"

@interface IRFAppDelegate () <IRFNavigationControllerDelegate>
@property NSUInteger currentViewControllerIndex;
@property IRFNavigationController *navigationViewController;
@end

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

@implementation IRFAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.currentViewControllerIndex = 0;
    CGRect bounds = [self.contentView bounds];
    NSViewController *vc = [self viewControllerWithIndex:self.currentViewControllerIndex];
    self.navigationViewController = [[IRFNavigationController alloc] initWithFrame:bounds rootViewController:vc];
    [self.navigationViewController setDelegate:self];
    [self.contentView addSubview:self.navigationViewController.view];
}

- (void)showNextViewController {
    self.currentViewControllerIndex++;
    NSViewController *vc = [self viewControllerWithIndex:self.currentViewControllerIndex];
    [self.navigationViewController pushViewController:vc animated:YES];
}

- (IRFDemoViewController*)viewControllerWithIndex:(NSUInteger)index {
    IRFDemoViewController *vc = [[IRFDemoViewController alloc] initWithNibName:NSStringFromClass([IRFDemoViewController class])bundle:nil];
    [vc setIndex:index];
    return vc;
}

- (IBAction)nextButtonAction:(id)sender {
    [self showNextViewController];
}

//------------------------------------------------------------------------------
#pragma mark - IRFNavigationControllerDelegate
//------------------------------------------------------------------------------

- (id<IRFViewControllerAnimatedTransitioning>)navigationController:(IRFNavigationController *)navigationController animationControllerForOperation:(IRFNavigationControllerOperation)operation fromViewController:(NSViewController*)fromVC toViewController:(NSViewController*)toVC {
    return [IRFDemoAnimator new];
}

@end
