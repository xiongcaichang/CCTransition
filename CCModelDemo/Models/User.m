//
//  User.m
//  CCModel
//
//  Created by bear on 16/6/17.
//  Copyright © 2016年 bear. All rights reserved.
//


#import "User.h"
//#import "CCDBHelper.h"

@interface User ()

@property (nonatomic, copy) NSString *duty;

@end

@implementation User

#pragma mark - override method



+(NSArray *)transients
{
    return [NSArray arrayWithObjects:@"field1",@"field2",nil];
}

@end
