//
//  CCLayerAnimation.h
//  CCTransitionAnimation
//
//  Created by bear on 5/7/16.
//  Copyright (c) 2016 bear. All rights reserved.

#import "CCBaseAnimation.h"

/**
 Types of layer animation
 */
typedef NS_ENUM(NSInteger, CCLayerAnimationType) {
    CCLayerAnimationCover,
    CCLayerAnimationReveal
};

@interface CCLayerAnimation : CCBaseAnimation

/** Inits with specific layer type.
 @param type Type of layer animation.
 @return An instance of CCLayerAnimation with the specified type.
 */
- (instancetype)initWithType:(CCLayerAnimationType)type;

@end
