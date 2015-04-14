//
//  FirstVC.m
//  BLUR
//
//  Created by Patrik Vaberer on 4/3/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "FirstVC.h"
#import "SecondVC.h"
#import "PushAnimator.h"
#import "ModalVC.h"
#import "AnimatorModal.h"
@import QuartzCore;
#define DEG_FROM_RAD(R) (R * M_PI / 180.0)

@interface FirstVC ()<UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CGAffineTransform t2DRotate = CGAffineTransformRotate(self.lSanFrancisco.transform, DEG_FROM_RAD(90));



    CATransform3D t3DRotate = CATransform3DIdentity;
    t3DRotate.m34 = 1.0 / -500;
    t3DRotate = CATransform3DRotate(t3DRotate, DEG_FROM_RAD(70), 0.0f, 1.0f, 00.0f);//z always zero

    
    CATransform3D t3DTranslate = CATransform3DIdentity;
    t3DTranslate.m34 = 1.0 / -500;
    t3DTranslate = CATransform3DTranslate(t3DTranslate, 0, 0, 90);//z is scale
    
    CATransform3D t3DScale = CATransform3DIdentity;
    t3DScale.m34 = 1.0 / -500;
    t3DScale = CATransform3DScale(t3DScale, 1.4, 1.4, 1);//z is always zero
    
    
    
    //rotate to depth
    CATransform3D t3DDepth = CATransform3DIdentity;
    t3DDepth.m34 = 1.0/-900;
    t3DDepth = CATransform3DScale(t3DDepth, 0.95, 0.95, 1);
    t3DDepth = CATransform3DRotate(t3DDepth, DEG_FROM_RAD(20), 1, 0, 0);
    
    
        
//        [UIView animateKeyframesWithDuration:.8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
//            
//            
//          
//            //     self.navigationController.navigationBar.layer.transform = t3DDepth;
////            
//            [UIView addKeyframeWithRelativeStartTime:0.5f relativeDuration:0.5f animations:^{
//                
//                self.view.layer.shouldRasterize = YES;
//                self.navigationController.navigationBar.layer.shouldRasterize = YES;
//                self.view.layer.transform = t3DDepth;            }];
//        } completion:nil];
    
        

//[UIView animateWithDuration:.8 animations:^{
//    
//    self.view.layer.shouldRasterize = YES;
//              self.navigationController.navigationBar.layer.shouldRasterize = YES;
//                    self.view.layer.transform = t3DDepth;
//}];

    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
    
   }

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Stop being the navigation controller's delegate
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}
- (IBAction)bModalPressed:(UIButton *)sender {
    
    
    UIStoryboard *storyboard = self.storyboard;
    ModalVC *controller = (ModalVC *)[storyboard instantiateViewControllerWithIdentifier:@"ModalVC"];
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.transitioningDelegate = self;
    [self presentViewController:controller animated:YES completion:nil];

}


//animation
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController*)fromVC
                                                 toViewController:(UIViewController*)toVC
{
    
    //    if (operation == UINavigationControllerOperationPush)
    //        return [[PushAnimator alloc] init];
    
    if (operation == UINavigationControllerOperationPush)
        return [[PushAnimator alloc] init];
    
    return nil;
}

- (IBAction)button:(id)sender {
    
    
//    UIStoryboard *storyboard = self.storyboard;
//    SecondVC *controller = (SecondVC *)[storyboard instantiateViewControllerWithIdentifier:@"SecondVC"];
//    controller.modalPresentationStyle = UIModalPresentationCustom;
//    [self presentViewController:controller animated:NO completion:nil];

}


//MARK: animators

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[AnimatorModal alloc] initWithShow:YES];
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[AnimatorModal alloc] initWithShow:NO];
    
}

@end
