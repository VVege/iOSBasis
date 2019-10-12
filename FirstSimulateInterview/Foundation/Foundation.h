//
//  Foundation.h
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/9.
//  Copyright © 2019 vege. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Foundation : NSObject

@end

@interface SyncTest : NSObject
@property(nonatomic, strong)NSMutableArray *dataArray;
- (void)test;
@end
NS_ASSUME_NONNULL_END
