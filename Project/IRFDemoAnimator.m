//
//  IRFDemoAnimator.m
//  IRFNavigationKit
//
//  Created by Fabio Pelosin on 16/11/13.
//  Copyright (c) 2013 Fabio Pelosin. All rights reserved.
//

#import "IRFDemoAnimator.h"
@import QuartzCore;

@implementation IRFDemoAnimator


- (NSTimeInterval)transitionDuration:(id<IRFViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<IRFViewControllerContextTransitioning>)transitionContext {
    NSViewController* toVC = [transitionContext viewControllerForKey:IRFTransitionContextToViewControllerKey];
    NSViewController* fromVC = [transitionContext viewControllerForKey:IRFTransitionContextFromViewControllerKey];
    [transitionContext.containerView setWantsLayer:TRUE];
    [transitionContext.containerView addSubview:toVC.view];

    [fromVC.view.layer setZPosition:0];
    [toVC.view.layer setZPosition:1000];
    NSPoint anchorPoint = CGPointMake(0.5, 0.5);
    [toVC.view.layer setAnchorPoint:anchorPoint];
    [toVC.view.layer setPosition:CGPointMake(transitionContext.containerView.layer.bounds.size.width * anchorPoint.x, transitionContext.containerView.layer.bounds.size.height * anchorPoint.y)];

    CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0f / -400.0f;
    //transform = CATransform3DRotate(transform, M_PI_2, -1, 0, 0);
    transform = CATransform3DScale(transform, 1.2, 1.2, 1);
    [transformAnimation setToValue:[NSValue valueWithCATransform3D:CATransform3DIdentity]];
    [transformAnimation setFromValue:[NSValue valueWithCATransform3D:transform]];

    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [opacityAnimation setFromValue:@0];
    [opacityAnimation setToValue:@1.0];


    [CATransaction begin];
    [toVC.view.layer setOpacity:1.0];
    [CATransaction setAnimationDuration:[self transitionDuration:transitionContext]];
    [[toVC.view layer] addAnimation:transformAnimation forKey:@"Transform"];
    [[toVC.view layer] addAnimation:opacityAnimation forKey:@"opacityAnimation"];
    [CATransaction setCompletionBlock:^{
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    [CATransaction commit];
}

- (void)animationEnded:(BOOL)transitionCompleted {

}

@end
