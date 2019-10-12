//
//  Algorithm.h
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/3.
//  Copyright © 2019 vege. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Algorithm : NSObject

/**
 二分查找

 @param defination 目标值
 @param array 有序数组
 */
+(void)binarySearch:(int)defination array:(NSArray *)array;

/**
 链表反转
 */
+ (void)reverstLinkList;

/**
 查找两个view的共同superView
 */
+ (NSArray *)sameSuperViewWith:(UIView *)fisrtView secondView:(UIView *)secondView;


/**
 查找一个数组的中位数

 @param array 数组数量大于3
 */
+ (void)middleNumInArray:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END
