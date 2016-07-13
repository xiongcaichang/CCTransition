//
//  CCViewController.h
//  CCTransitionAnimation
//https://github.com/xiongcaichang/CCTransition
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBaseAnimation.h"

@interface CCViewController : UIViewController <UIViewControllerTransitioningDelegate>

/**
 Animation for the transition
 */
@property (strong, nonatomic) CCBaseAnimation *animationController;

/**
 Whether interaction should be enabled for transitioning
 */
@property (assign, nonatomic) BOOL interactionEnabled;

/** Inits with nib and transitioning animations
 @param animation Animation for the transition
 @return An instance of CCFancyViewController
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withAnimation:(CCBaseAnimation *) animation;

@end
