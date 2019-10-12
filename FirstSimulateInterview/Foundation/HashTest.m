//
//  HashTest.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/9.
//  Copyright © 2019 vege. All rights reserved.
//

#import "HashTest.h"

@implementation HashTest
- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    }
    HashTest *otherObject = (HashTest *)other;
    if (![self.title isEqualToString:otherObject.title]) {
        return NO;
    }
    if (![self.title isEqualToString:otherObject.hair]) {
        return NO;
    }
    if (![self.title isEqualToString:otherObject.name]) {
        return NO;
    }
    return YES;
}

- (NSUInteger)hash
{
    NSUInteger nameHash = [_name hash];
    NSUInteger hariHash = [_hair hash];
    NSUInteger titleHash = [_title hash];
    
    return nameHash ^ hariHash ^ titleHash;
}
- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

@end
