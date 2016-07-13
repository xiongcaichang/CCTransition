//
//  CCBounceAnimation.h
//  CCTransitionAnimation
//
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.
//

#import "CCBaseAnimation.h"

/**
 Types of sliding animation
 */
typedef NS_ENUM (NSInteger, CCSlideAnimationType){
    CCSlideAnimationFromLeft,
    CCSlideAnimationFromRight,
    CCSlideAnimationFromTop,
    CCSlideAnimationFromBottom
};

@interface CCSlideAnimation : CCBaseAnimation

/**
 Velocity of the sliding.
 */
@property (assign, nonatomic) CGFloat velocity;

/**
 Damping of the sliding.
 */
@property (assign, nonatomic) CGFloat damping;

/** Inits with specific sliding type.
 @param type sliding direction.
 @return An instance of CCBounceAnimation with the specified bouncing direction.
 */
- (instancetype) initWithType:(CCSlideAnimationType)type;

@end
