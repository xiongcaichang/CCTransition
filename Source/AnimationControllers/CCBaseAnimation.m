//
//  CCBaseAnimation.m
//  CCTransitionAnimation
//
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import "CCBaseAnimation.h"

@implementation CCBaseAnimation

#pragma mark - Init method

- (id) init
{
    self = [super init];
    if (self){
        self.animationDuration = 1.0f;
    }
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    int starY=64;
    if (_modalTransition) {
        starY=0;
    }
    
    fromView.frame=CGRectMake(0, starY, SCREEN_WIDTH, SCREEN_HEIGHT);
    toView.frame=CGRectMake(0, starY, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [self animateTransition:transitionContext fromView:fromView toView:toView];
}


#pragma mark - Helper methods

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromView:(UIView*)fromView toView:(UIView*)toView
{
    
}

- (void)setInteractionEnabled
{
    
}

@end
