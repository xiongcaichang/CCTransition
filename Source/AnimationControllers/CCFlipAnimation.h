//
//  CCFlipAnimation.h
//  CCTransitionAnimation
//
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import "CCBaseAnimation.h"

/**
 Types of flip animation
 */
typedef NS_ENUM(NSInteger, CCFlipAnimationType) {
    CCFlipAnimationLeft,
    CCFlipAnimationRight,
    CCFlipAnimationTop,
    CCFlipAnimationBottom
};

@interface CCFlipAnimation : CCBaseAnimation

/** Inits with specific flip type.
 @param type Type of flip animation.
 @return An instance of CCFlipAnimation with the specified type.
 */
- (instancetype)initWithType:(CCFlipAnimationType)type;

@end
