//
//  Foundation.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/9.
//  Copyright © 2019 vege. All rights reserved.
//

#import "Foundation.h"
#import "HashTest.h"
#import "Property.h"

@implementation Foundation

-(instancetype)init {
    self = [super init];
    if (self) {
//        NSNull * obj = [NSNull null];
//        NSLog(@"%@",obj);
//        
//        BOOL a = 8960;
//        bool b = 8960;
//        NSLog(@"%@", @(a));
//        NSLog(@"%@", @(b));
//        
//        SyncTest * sync = [[SyncTest alloc]init];
//        [sync test];
        
        HashTest *test1 = [[HashTest alloc]init];
        test1.hair = @"黑色";
        test1.name = @"捷克";
        test1.title  = @"大黑牛漆";
 
        HashTest *test2 = [[HashTest alloc]init];
        test2.hair = @"绿色";
        test2.name = @"捷克";
        test2.title  = @"大黑牛漆";
        
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:@1 forKey:test1];
        [dic setObject:@2 forKey:test2];
        test1.hair = @"绿色";
        test2.hair = @"蓝色";
        //这里虽然test1和原来test2的hash相等，但通过dic[test1]获取的依然是正确值
        NSLog(@"%@", dic[test1]);
        
        Property *property = [[Property alloc]init];
        [property test];
    }
    return self;
}
@end

@interface SyncTest()
{
    dispatch_queue_t outQueue;
    dispatch_queue_t concurrentQueue;
    dispatch_queue_t serialQueue;
    NSLock          *lock;
}
@end
@implementation SyncTest
- (instancetype)init
{
    self = [super init];
    if (self) {
        outQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        serialQueue = dispatch_queue_create("com.serial.queue", NULL);
        concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        
        lock = [[NSLock alloc]init];
        self.dataArray = [NSMutableArray new];
    }
    return self;
}

- (void)test {
    for (int i = 0; i < 10000; i ++) {
        dispatch_async(outQueue, ^{
            //1同步串行队列
            dispatch_sync(self->serialQueue, ^{
                [self.dataArray addObject:@(i)];
                NSLog(@"%d", i);
            });

            //2.锁
            [self->lock lock];
            [self.dataArray addObject:@(i)];
            NSLog(@"%d", i);
            [self->lock unlock];

            //3.并行队列的barrier
            dispatch_barrier_async(self->concurrentQueue, ^{
                [self.dataArray addObject:@(i)];
                NSLog(@"%d", i);
            });
        });
    }
}

@end
