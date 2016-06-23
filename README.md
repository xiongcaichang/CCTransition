# CCModel
字典转模型 自动缓存


## 安装(Installation)



*传统方法: 把 lib 文件夹下面的文件拖入你的项目  manually: Drag all Classes under lib into your project.  


##使用 (Usage)

在模型类头文件中导入 CCmodel  让你的模型继承自 CCModel  下面将以 User 模型为例
```objc
#import "CCModel.h"

@interface User : CCModel

```

*   字典转模型   api
```objc

/**
 *  字典转模型
 *
 *  @param dict
 *
 *  @return instance
 */
+ (instancetype)modelWithDict:(NSDictionary *)dict;


```
示例(Example)

```objc
            NSDictionary *dict=@{@"name":@" 赵五",@"sex":@"女",@"age":@(20)};
            User *user=[User modelWithDict:dict];
```





* 数据库操作 操作 api

```objc
/** 数据库中是否存在表 */
+ (BOOL)isExistInTable;
/** 保存或更新
 * 如果不存在主键，保存，
 * 有主键，则更新
 */
- (BOOL)saveOrUpdate;
/** 保存单个数据 */
- (BOOL)save;
/** 批量保存数据 */
+ (BOOL)saveObjects:(NSArray *)array;
/** 更新单个数据 */
- (BOOL)update;
/** 批量更新数据*/
+ (BOOL)updateObjects:(NSArray *)array;
/** 删除单个数据 */
- (BOOL)deleteObject;
/** 批量删除数据 */
+ (BOOL)deleteObjects:(NSArray *)array;
/** 通过条件删除数据 */
+ (BOOL)deleteObjectsByCriteria:(NSString *)criteria;
/** 清空表 */
+ (BOOL)clearTable;

/** 查询全部数据 */
+ (NSArray *)findAll;

/** 通过主键查询 */
+ (instancetype)findByPK:(int)inPk;

/** 查找某条数据 */
+ (instancetype)findFirstByCriteria:(NSString *)criteria;

/** 通过条件查找数据 
 * 这样可以进行分页查询 @" WHERE pk > 5 limit 10"
 */
+ (NSArray *)findByCriteria:(NSString *)criteria;
/**
 * 创建表
 * 如果已经创建，返回YES
 */
+ (BOOL)createTable;

#pragma mark - must be override method
/** 如果子类中有一些property不需要创建数据库字段，那么这个方法必须在子类中重写 
 */
+ (NSArray *)transients;

```


示例(Example)  一般数据库操作全部在子线程完成  一下示例基于 GCD
```objc


/** 开一条子线程:插入多条用户数据 */
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

```


