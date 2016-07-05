//
//  PushAnimator.m
//  BLUR
//
//  Created by Patrik Vaberer on 4/3/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "PushAnimator.h"

@implementation PushAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIViewController* fromViewController   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    [[transitionContext containerView] addSubview:toViewController.view];
    
    
    CGRect endPos = toViewController.view.frame;
    
    CGRect startPos = fromViewController.view.frame;
    startPos.origin.x =  - startPos.size.width;
    toViewController.view.frame = startPos;
    
  
//         [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//    
//            fromViewController.view.transform=CGAffineTransformMakeScale(.8, .8);
//                     toViewController.view.frame = endPos;
//
//    
//        } completion:^(BOOL finished) {
//            fromViewController.view.transform=CGAffineTransformMakeScale(1, 1);
//
//            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        }];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.9 options:0 animations:^{
        
        toViewController.view.frame = endPos;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}



//- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
//{
//    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *container = [transitionContext containerView];
//    
//    if (self.reverse) {
//        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
//    }
//    else {
//        toViewController.view.transform = CGAffineTransformMakeScale(0, 0);
//        [container addSubview:toViewController.view];
//    }
//    
//    [UIView animateKeyframesWithDuration:.5 delay:0 options:0 animations:^{
//        if (self.reverse) {
//            fromViewController.view.transform = CGAffineTransformMakeScale(0, 0);
//        }
//        else {
//            toViewController.view.transform = CGAffineTransformIdentity;
//        }
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:finished];
//    }];
//}

@end
