//
//  ViewController.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/2.
//  Copyright © 2019 vege. All rights reserved.
//

#import "ViewController.h"
#import "Algorithm.h"
#import "Foundation.h"
#import "VGView.h"
#import "CircleProgressLayer.h"
#import "RuntimeTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testAlgorithm];
//    [self testFoundation];
//    [self testUIView];
//    [self testCAAction];
    [self testRuntime];
}

- (void)testAlgorithm {
    NSArray *a = @[@1,@3,@4,@5,@7,@8,@9];
    
    [Algorithm binarySearch:19 array:a];
    
    [Algorithm reverstLinkList];
    
    UIView *view1 = [[UIView alloc]init];
    UIView *view2 = [[UIView alloc]init];
    UIView *view3 = [[UIView alloc]init];
    UIView *view4 = [[UIView alloc]init];
    [self.view addSubview:view4];
    [view4 addSubview:view3];
    [view4 addSubview:view1];
    [view3 addSubview:view2];
    NSArray * sameSuperViews = [Algorithm sameSuperViewWith:view1 secondView:view2];
    NSLog(@"%@",sameSuperViews);
    
    NSArray *b = @[@9,@10,@3,@19,@7,@11,@1];
    [Algorithm middleNumInArray:b];
}

- (void)testFoundation{
    Foundation *a = [[Foundation alloc]init];
    NSLog(@"%@",a);
}

- (void)testUIView {
    VGView *vgView = [[VGView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
    vgView.backgroundColor = UIColor.greenColor;
    [self.view addSubview:vgView];
    
    [UIView animateWithDuration:5 animations:^{
        vgView.frame = CGRectMake(200, 500, 50, 50);
    }];
    NSLog(@"%@",NSStringFromCGRect(vgView.frame));
    NSLog(@"model %@",NSStringFromCGRect(vgView.layer.modelLayer.frame));
    NSLog(@"present %@",NSStringFromCGRect(vgView.layer.presentationLayer.frame));
}

- (void)testCAAction {
    NSArray * colors = @[(id)[[UIColor blackColor] CGColor],
                         (id)[[UIColor blueColor] CGColor],
                         (id)[[UIColor whiteColor] CGColor],
                         (id)[[UIColor purpleColor] CGColor],
                         (id)[[UIColor orangeColor] CGColor]];
    NSArray * locations = @[@0.1,@0.3,@0.5,@0.7,@1];

    CAGradientLayer *gradientLayer = [CAGradientLayer new];
    gradientLayer.frame = CGRectMake(100, 100, 200, 200);
    gradientLayer.colors = colors;
    gradientLayer.locations = locations;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    [self.view.layer addSublayer:gradientLayer];

    CircleProgressLayer *circularProgress = [[CircleProgressLayer alloc] initWithFrame:gradientLayer.bounds];
    gradientLayer.mask = circularProgress;

    circularProgress.arcLength = 50;
}

- (void)testRuntime {
    RuntimeTest *test = [[RuntimeTest alloc]init];
    [test test];
    NSLog(@"");
}
@end
