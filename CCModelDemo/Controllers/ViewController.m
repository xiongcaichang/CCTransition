//
//  ViewController.m
//  CCModel
//
//  Created by bear on 16/6/17.
//  Copyright © 2016年 bear. All rights reserved.
//


#import "ViewController.h"
#import "QueryTableViewController.h"
#import "User.h"
#import "Depart.h"
#import "CCDBHelper.h"

@implementation ViewController

#pragma mark - 插入数据


/** 子线程一:插入多条用户数据 */
- (IBAction)insertData2:(id)sender {

    dispatch_queue_t q1 = dispatch_queue_create("queue1", NULL);
    dispatch_async(q1, ^{
        for (int i = 0; i < 5; ++i) {
            User *user = [[User alloc] init];
            user.name = @"赵五";
            user.sex = @"女";
            user.age = i+5;
            [user save];
        }
    });
}





#pragma mark - 删除数据
/** 通过条件删除数据 */
- (IBAction)deleteData:(id)sender {
//    [User deleteObjectsByCriteria:@" WHERE pk < 10"];
    [User deleteObjectsWithFormat:@"Where %@ < %d",@"pk",10];
}



#pragma mark - 修改数据
/** 创建多个线程更新数据 */
- (IBAction)updateData1:(id)sender {
    for (int i = 0; i < 5; i++) {
        User *user = [[User alloc] init];
        user.name = [NSString stringWithFormat:@"更新%d",i];
        user.age = 120+i;
        user.pk = 5+i;
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [user update];
        });
    }
}



#pragma mark - 查询
/** 查询单条记录 */
- (IBAction)queryData1:(id)sender {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"第一条:%@",[[User findFirstByCriteria:@" WHERE age = 2 "] name]);
    });
}

/**  条件查询多条记录 */
- (IBAction)queryData2:(id)sender {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"小于20岁:%@",[User findByCriteria:@" WHERE age < 20 "]);
    });
}

/** 查询全部数据 */
- (IBAction)queryData3:(id)sender {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"全部:%@",[User findAll]);
    });
}

/** 分页查询数据 */
- (IBAction)queryData:(id)sender {
    static int pk = 5;
    NSArray *array = [User findByCriteria:[NSString stringWithFormat:@" WHERE pk > %d limit 10",pk]];
    pk = ((User *)[array lastObject]).pk;
    NSLog(@"array:%@",array);
}








- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *title = @"查询";
    int type = 3;
    if ([segue.identifier isEqualToString:@"One"]) {
        title = @"查询一条数据";
        type = 1;
    } else if ([segue.identifier isEqualToString:@"Two"]){
        title = @"条件查询";
        type = 2;
    }else if ([segue.identifier isEqualToString:@"Three"]){
        title = @"查询全部";
        type = 3;
    }else if ([segue.identifier isEqualToString:@"Four"]){
        title = @"分页查询";
        type = 4;
    }
    
    QueryTableViewController *destVC = segue.destinationViewController;
    destVC.title = title;
    destVC.type = type;
}


@end
