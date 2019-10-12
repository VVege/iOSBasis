//
//  RuntimeTest.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/19.
//  Copyright © 2019 vege. All rights reserved.
//

#import "RuntimeTest.h"
#import <objc/runtime.h>

@implementation RuntimeTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _value = @5;
    }
    return self;
}

- (void)test {
    
}
@end
