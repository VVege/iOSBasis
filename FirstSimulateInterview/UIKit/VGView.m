//
//  VGView.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/10.
//  Copyright © 2019 vege. All rights reserved.
//

#import "VGView.h"

@interface VGView()<CALayerDelegate, CAAnimationDelegate>
@property(nonatomic, strong)CALayer *testLayer;
@end
@implementation VGView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _testLayer = [[CALayer alloc]init];
        _testLayer.backgroundColor = UIColor.redColor.CGColor;
        _testLayer.frame = self.bounds;
        [self.layer addSublayer:_testLayer];
        
        CABasicAnimation *animation = [[CABasicAnimation alloc]init];
        animation.duration = 5;
        animation.fromValue = @0;
        animation.toValue = @1;
        animation.keyPath = @"opacity";
        [_testLayer addAnimation:animation forKey:@"key"];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    
}

- (void)layoutSubviews{
    
}
#pragma mark - Public
- (void)play{
    
}

#pragma mark - CALayerDelegate
- (void)displayLayer:(CALayer *)layer {
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    
}

- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    NSLog(@"%@", event);
    return nil;
}



#pragma mark - CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim {
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}
@end
