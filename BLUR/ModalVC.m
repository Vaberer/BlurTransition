//
//  ModalVC.m
//  BlurTransitionDemo
//
//  Created by Patrik Vaberer on 4/4/15.
//  Copyright (c) 2015 Patrik Vaberer. All rights reserved.
//

#import "ModalVC.h"

@interface ModalVC ()

@end

@implementation ModalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bDismissPressed {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
