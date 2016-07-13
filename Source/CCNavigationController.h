//
//  CCNavigationController.h
//  CCTransitionAnimation
//https://github.com/xiongcaichang/CCTransition
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBaseAnimation.h"

@interface CCNavigationController : UINavigationController <UINavigationControllerDelegate>

/** 
 Animation for the transition
 */
@property (strong, nonatomic) CCBaseAnimation *animationController;

/**
 Whether interaction should be enabled for transitioning
 */
@property (assign, nonatomic) BOOL interactionEnabled;

/** Inits with rootViewController and transitioning animations
 @param animation Animation for the transition
 @return An instance of CCFancyNavigationController
 */
- (id)initWithRootViewController:(UIViewController *)rootViewController withAnimation:(CCBaseAnimation *)animation;

@end
