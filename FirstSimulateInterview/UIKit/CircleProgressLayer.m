//
//  CircleProgressLayer.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/11.
//  Copyright © 2019 vege. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleProgressLayer.h"

@implementation CircleProgressLayer
@dynamic arcLength;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.frame = frame;
        [self setup];
    }
    return self;
}

- (void)setup{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:50 startAngle:0 endAngle:2*M_PI clockwise:NO];
    
    self.path = path.CGPath;
    self.fillColor = [UIColor clearColor].CGColor;
    self.strokeColor = [UIColor greenColor].CGColor;
    self.lineWidth = 3;
    self.delegate = self;
    self.strokeStart = 0;
    self.strokeEnd = 0;
}

#pragma mark - CALayerDelegate
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    if([event isEqualToString:@"arcLength"]){
        CircleProgressAction *action = [[CircleProgressAction alloc]init];
        action.oldValue = self.arcLength;
        NSLog(@"----%f",self.arcLength);
        return action;
    }
    return nil;
}
@end

@implementation CircleProgressAction
- (void)runActionForKey:(NSString *)event object:(id)anObject arguments:(NSDictionary *)dict{
    CircleProgressLayer *layer = anObject;
    CABasicAnimation * animation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration=3;
    animation.fromValue=[NSNumber numberWithFloat:self.oldValue/100.0];
    animation.toValue=[NSNumber numberWithFloat:[[layer valueForKey:event] floatValue]/100.0];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [layer addAnimation:animation forKey:@"strokeEnd"];
}
@end
