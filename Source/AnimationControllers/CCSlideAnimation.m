//
//  CCBounceAnimation.m
//  CCTransitionAnimation
//
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import "CCSlideAnimation.h"
#import "CCNavigationController.h"

@interface CCSlideAnimation()
@property (assign, nonatomic) BOOL shouldCompleteTransition;
@end

@implementation CCSlideAnimation

#pragma mark - Init methods

- (instancetype) init
{
    self = [super init];
    if (self){
        self.damping = 0.8;
        self.velocity = 1.0;
    }
    return self;
}

- (instancetype) initWithType:(CCSlideAnimationType)type
{
    self = [super init];
    if (self){
        self.type = type;
        self.damping = 0.8;
        self.velocity = 1.0;
    }
    return self;
}


#pragma mark - Overriden methods

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromView:(UIView *)fromView toView:(UIView *)toView
{
    UIView *containerView = [transitionContext containerView];
    
    CGPoint temporaryPoint = CGPointZero;
    CGPoint centerPoint = toView.center;
    
    switch (self.type) {
        case CCSlideAnimationFromBottom:
            temporaryPoint = CGPointMake(CGRectGetMidX(fromView.frame), 1.5*CGRectGetMaxY(fromView.frame));
            break;
        case CCSlideAnimationFromTop:
            temporaryPoint = CGPointMake(CGRectGetMidX(fromView.frame), -CGRectGetMaxY(fromView.frame));
            break;
        case CCSlideAnimationFromLeft:
            temporaryPoint = CGPointMake(-CGRectGetMaxX(fromView.frame), CGRectGetMidY(fromView.frame));
                break;
        case CCSlideAnimationFromRight:
            temporaryPoint = CGPointMake(1.5*CGRectGetMaxX(fromView.frame), CGRectGetMidY(fromView.frame));
            break;
        default:
            break;
    }
    
    if (self.reverse){
        [containerView addSubview:toView];
        [containerView sendSubviewToBack:toView];
    } else {
        [containerView addSubview:toView];
        [containerView bringSubviewToFront:toView];
        toView.center = temporaryPoint;
    }
    
    //Animate using spring animation
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:self.damping initialSpringVelocity:self.velocity options:0 animations:^{
        if (self.reverse){
            fromView.center = temporaryPoint;
        } else {
            toView.center = centerPoint;
        }
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        [fromView removeFromSuperview];
    }];
    
}

- (void)setInteractionEnabled
{
    self.gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.toViewController.view addGestureRecognizer:self.gesture];
}


#pragma mark - Helper methods

- (void) handleGesture:(UIPanGestureRecognizer*)gestureRecognizer
{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    CGPoint vel = [gestureRecognizer velocityInView:gestureRecognizer.view];
    
    BOOL horizontalPan = (self.type == CCSlideAnimationFromLeft || self.type == CCSlideAnimationFromRight);
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            
            BOOL rightToLeftSwipe = vel.x < 0;
            BOOL leftToRightSwipe = vel.x > 0;
            BOOL topToBottomSwipe = translation.y > 0;
            BOOL bottomToTopSwipe = translation.y < 0;
            
            // perform the required navigation operation ...
            if (horizontalPan){
                if ((self.type == CCSlideAnimationFromLeft && rightToLeftSwipe) ||
                    (self.type == CCSlideAnimationFromRight && leftToRightSwipe)){
                    [self dismissViewController];
                }
            } else {
                if ((self.type == CCSlideAnimationFromTop && bottomToTopSwipe) ||
                    (self.type == CCSlideAnimationFromBottom && topToBottomSwipe)){
                    [self dismissViewController];
                }
            }
            
            break;
        }
        case UIGestureRecognizerStateChanged: {
            if (self.interactionInProgress) {
                CGFloat fraction = 0;
                
                if (horizontalPan){
                    // compute the current position
                    fraction = fabs(translation.x / 200.0);
                    fraction = fminf(fmaxf(fraction, 0.0), 1.0);
                    self.shouldCompleteTransition = (fraction > 0.5);
                    
                } else {
                    // compute the current position
                    fraction = fabs(translation.y / 200.0);
                    fraction = fminf(fmaxf(fraction, 0.0), 1.0);
                    self.shouldCompleteTransition = (fraction > 0.5);
                }

                if (fraction >= 1.0){
                    fraction = 0.99;
                }
                
                [self updateInteractiveTransition:fraction];
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
            if (self.interactionInProgress) {
                self.interactionInProgress = NO;
                if (!self.shouldCompleteTransition || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                    [self cancelInteractiveTransition];
                } else {
                    [self finishInteractiveTransition];
                }
            }
            break;
        default:
            break;
    }
    
}

- (void)dismissViewController
{
    if (self.modalTransition){
        [self.toViewController dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.toViewController.navigationController popViewControllerAnimated:YES];
    }
}

@end