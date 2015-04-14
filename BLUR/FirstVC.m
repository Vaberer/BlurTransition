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
#import "ModalAnimator.h"
@import QuartzCore;
#define DEG_FROM_RAD(R) (R * M_PI / 180.0)

@interface FirstVC ()<UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    


    
    
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
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController*)fromVC toViewController:(UIViewController*)toVC
{

    if (operation == UINavigationControllerOperationPush)
        return [[PushAnimator alloc] init];
    
    return nil;
}

- (IBAction)button:(id)sender {
    
    

}


//MARK: animators

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [[ModalAnimator alloc] initWithShow:YES];
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [[ModalAnimator alloc] initWithShow:NO];
    
}

@end
