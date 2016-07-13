//
//  CCScaleAnimation.h
//  CCTransitionAnimation
//
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import "CCBaseAnimation.h"

/**
 Types of scale animation
 */

typedef NS_ENUM(NSInteger, CCScaleAnimationType){
    CCScaleAnimationFadeIn,
    CCScaleAnimationDropIn
};

@interface CCScaleAnimation : CCBaseAnimation

/** Inits with specific zooming type.
 @param type Type of scale animation.
 @return An instance of CCScaleAnimation with the specified type.
 */
- (instancetype) initWithType:(CCScaleAnimationType)type;

@end
