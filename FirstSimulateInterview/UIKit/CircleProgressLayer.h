//
//  CircleProgressLayer.h
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/11.
//  Copyright © 2019 vege. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleProgressLayer : CAShapeLayer<CALayerDelegate>
@property (nonatomic, assign)float arcLength;
- (instancetype)initWithFrame:(CGRect)frame;
@end

@interface CircleProgressAction : NSObject<CAAction>
@property(assign, nonatomic)float oldValue;
@end

NS_ASSUME_NONNULL_END
