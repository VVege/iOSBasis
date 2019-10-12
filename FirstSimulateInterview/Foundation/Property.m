//
//  Property.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/10.
//  Copyright © 2019 vege. All rights reserved.
//

#import "Property.h"

@implementation Property
//@synthesize name = _myName;
@dynamic name;
- (void)test {
    self.name = @"";
    NSLog(@"%@", self.name);
    typeof(self) a = self;
    NSLog(@"%@",a.name);
}

-(void)setName:(NSString *)name {
    
}

- (NSString *)name {
    return @"aa";
}
@end
