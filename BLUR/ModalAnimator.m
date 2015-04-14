//
//  AnimatorModal.m
//  BlurTransitionDemo
//
//  Created by Patrik Vaberer on 4/4/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "ModalAnimator.h"

@interface ModalAnimator()
@property BOOL show;

@end
@implementation ModalAnimator

- (instancetype)initWithShow:(BOOL)show {
    
    self = [super init];
    if (self) {
        self.show = show;
    }
    return self;
    
    
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    
    UIViewController* toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController   = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    if (self.show) {
        
        
        toViewController.view.alpha = 0;
        [containerView  addSubview:toViewController.view];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toViewController.view.alpha = 1;
            
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
        
    } else {
        
        [containerView insertSubview:fromViewController.view belowSubview:toViewController.view];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.alpha = 0;
            
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];

        
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
@end
