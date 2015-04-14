//
//  PopAnimator.m
//  BLUR
//
//  Created by Patrik Vaberer on 4/3/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "PopAnimator.h"
#import "FirstVC.h"
#import "SecondVC.h"
#define DEG_FROM_RAD(R) (R * M_PI / 180.0)

@implementation PopAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    FirstVC* toViewController   = (FirstVC *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    SecondVC* fromViewController = (SecondVC *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
     UIView *containerView = [transitionContext containerView];
    
    
    
    UILabel *lSanFrancisco = toViewController.lSanFrancisco;
    NSLayoutConstraint *cSanFranciscoCenterY = toViewController.cSanFranciscoCenterY;
    float defaultPositionSF = cSanFranciscoCenterY.constant;
    
    
    //change  position to the bottom of the screen
    cSanFranciscoCenterY.constant -= [transitionContext finalFrameForViewController:toViewController].size.height / 2;
    [lSanFrancisco layoutIfNeeded];
    
    //rotation of the label, the default position will be rotated about 90 degrees
    CGAffineTransform tForward = CGAffineTransformRotate(lSanFrancisco.transform, DEG_FROM_RAD(90));
    lSanFrancisco.transform = tForward;
    
    //set the animation while transitioning, but it's not fired, see animation block (UIView animateWithDuration...)
    CGAffineTransform tBackward = CGAffineTransformRotate(lSanFrancisco.transform, DEG_FROM_RAD(-90));

    
    //animation will go to the default position (center Y). To fire this event, we will use method layoutIfNeeded in the animation block bellow
    cSanFranciscoCenterY.constant =  defaultPositionSF;
    
    
    UILabel *lSilliconValley = fromViewController.lSilliconValley;
    NSLayoutConstraint *cSilliconValleyCenterX = fromViewController.cSilliconValleyCenterX;
    float defaultPositionSV = cSilliconValleyCenterX.constant;
    
    //assigning the value how the animation will look like, but it is fired in the animation block by layoutIfNeeded
    cSilliconValleyCenterX.constant = fromViewController.view.frame.size.width;
    

    
        
    
    [containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.alpha = 0.0;
        //fire animations
        [lSanFrancisco layoutIfNeeded];
       [lSilliconValley layoutIfNeeded];
        lSanFrancisco.transform = tBackward;
    } completion:^(BOOL finished) {

        //very important if the animation will not be finished, ie. by swipe back gesture, the position of the elements needs to be placed in the right position
        if (transitionContext.transitionWasCancelled) {
            cSanFranciscoCenterY.constant = defaultPositionSF;
            [lSanFrancisco layoutIfNeeded];
            
            cSilliconValleyCenterX.constant = defaultPositionSV;
            [lSilliconValley layoutIfNeeded];
            
            lSanFrancisco.transform = tBackward;


        }
        //announcing of completeness of the transition
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
