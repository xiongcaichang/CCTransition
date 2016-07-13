//
//  CCViewController.m
//  CCTransitionAnimation
//https://github.com/xiongcaichang/CCTransition
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import "CCViewController.h"

@interface CCViewController ()

@end

@implementation CCViewController

#pragma mark - Init methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withAnimation:(CCBaseAnimation *) animation
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.transitioningDelegate = self;
        self.animationController = animation;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setTransitioningDelegate:)]){
        self.transitioningDelegate = self;
    }
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.animationController.fromViewController = presenting;
    self.animationController.toViewController = presented;
    if (self.interactionEnabled){
        [self.animationController setInteractionEnabled];
    }
    self.animationController.reverse = NO;
    self.animationController.modalTransition = YES;
    return self.animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.animationController.reverse = YES;
    self.animationController.modalTransition = YES;
    return self.animationController;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactionEnabled && self.animationController.interactionInProgress ? self.animationController : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return self.interactionEnabled && self.animationController.interactionInProgress ? self.animationController : nil;
}


@end
