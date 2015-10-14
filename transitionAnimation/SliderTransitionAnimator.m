//
//  SliderTransitionAnimator.m
//  transitionAnimation
//
//  Created by Damon on 15/10/14.
//  Copyright © 2015年 zhangle.in.iMac. All rights reserved.
//

#import "SliderTransitionAnimator.h"



@implementation SliderTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *view = [transitionContext containerView];
    CGRect startFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect endFrame = [transitionContext finalFrameForViewController:toVC];
    if (self.isPresenting)
    {
        [view addSubview:fromVC.view];
        [view addSubview:toVC.view];
        toVC.view.frame = startFrame;
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            toVC.view.frame = endFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else
    {
        [view addSubview:toVC.view];
        [view addSubview:fromVC.view];
        [UIView animateWithDuration:1.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            fromVC.view.frame = startFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}
@end
