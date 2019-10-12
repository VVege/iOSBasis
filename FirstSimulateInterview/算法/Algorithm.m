//
//  Algorithm.m
//  FirstSimulateInterview
//
//  Created by 周智伟 on 2019/9/3.
//  Copyright © 2019 vege. All rights reserved.
//

#import "Algorithm.h"

@implementation Algorithm

#pragma mark - 二分查找
+(void)binarySearch:(int)defination array:(NSArray *)array {
    [self search:defination array:array start:0 end:(int)array.count - 1];
}

+(void)search:(int)defination array:(NSArray *)array start:(int)start end:(int)end{
    
    int middle = (start + end)/2;
    if (middle < 0 || middle >= array.count || start > end) {
        NSLog(@"未找到");
        return;
    }
    
    if ([array[middle]integerValue] == defination) {
        NSLog(@"已找到，位置在%d",middle);
        return;
    }
    
    if ([array[middle]integerValue] > defination) {
        [self search:defination array:array start:start end:middle - 1];
    }else{
        [self search:defination array:array start:middle + 1 end:end];
    }
}

#pragma mark - 链表反转
struct LinkListNode {
    int value;
    struct LinkListNode *next;
};

+ (struct LinkListNode *)generateLinkList {
    struct LinkListNode * node1 = malloc(sizeof(struct LinkListNode));
    node1->value = 5;
    node1->next = nil;
    
    struct LinkListNode * node2 = malloc(sizeof(struct LinkListNode));
    node2->value = 4;
    node2->next = node1;
    
    struct LinkListNode * node3 = malloc(sizeof(struct LinkListNode));
    node3->value = 3;
    node3->next = node2;
    
    struct LinkListNode * node4 = malloc(sizeof(struct LinkListNode));
    node4->value = 2;
    node4->next = node3;
    
    struct LinkListNode * node5 = malloc(sizeof(struct LinkListNode));
    node5->value = 1;
    node5->next = node4;
    
    return node5;
}

+ (void)reverstLinkList{
    
    ///头差法
    struct LinkListNode *p = [self generateLinkList];
    struct LinkListNode *newHead = nil;
    
    while (p != nil) {
        struct LinkListNode * next = p->next;
        p -> next = newHead;
        newHead = p;
        p = next;
    }
    
    struct LinkListNode *printNode = newHead;
    while (printNode != nil) {
        NSLog(@"%d",printNode->value);
        printNode = printNode->next;
    }
}

#pragma mark - 寻找两个view的所有公共superView
+ (NSArray *)sameSuperViewWith:(UIView *)fisrtView secondView:(UIView *)secondView {
    NSMutableArray * sameArray = [NSMutableArray new];
    NSArray *firstAncestors = [self allSuperViewsWith:fisrtView];
    NSArray *secondAncestors = [self allSuperViewsWith:secondView];
    
    int i = 0;
    while (i < MIN(firstAncestors.count, secondAncestors.count)) {
        //倒序遍历对比
        //巧妙点：这里不需要拿一个view的superView来对比另一个view的所有superView
        //而是根据view层级结构的特点，通过倒序的方式一一对比即可
        UIView *view1 = firstAncestors[firstAncestors.count - 1 -i];
        UIView *view2 = secondAncestors[secondAncestors.count - 1 - i];
        if (view1 == view2) {
            [sameArray addObject:view1];
        }else{
            break;
        }
        i ++;
    }
    return sameArray;
}

+ (NSArray *)allSuperViewsWith:(UIView *)view {
    NSMutableArray *superViewArray = [NSMutableArray new];
    UIView *superView = view.superview;
    while (superView != nil) {
        [superViewArray addObject:superView];
        superView = superView.superview;
    }
    return superViewArray;
}

#pragma mark - 无序数组求中位数
+ (void)middleNumInArray:(NSArray *)array {
    //初始化堆空间
    NSMutableArray *heap = [NSMutableArray new];
    int heapCount = (int)(array.count - 1)/2 + 1;
    if ((array.count - 1)%2 > 0) {
        heapCount += 1;
    }
    
    //建小顶堆
    for (int i = 0; i < array.count; i ++) {
        if (heap.count < heapCount) {
            [heap addObject:array[i]];
            [self heapLastForArray:heap];
        }else{
            if (heap[0] < array[i]) {
                heap[0] = array[i];
                [self heapFirstForArray:heap];
            }
        }
    }
    
    int middleValue = [heap[0]intValue];
    if ((array.count - 1)%2 > 0) {
        int otherMiddleValue = MIN([heap[1]intValue], [heap[2]intValue]);
        NSLog(@"中位数是%d和%d",middleValue,otherMiddleValue);
    }else{
        NSLog(@"中位数是%d",middleValue);
    }
}

+ (void)heapLastForArray:(NSMutableArray *)heap {
    int index = (int)heap.count - 1;
    while (index >= 1) {
        int rootIndex = (index - 1)/2;
        if (heap[rootIndex] > heap[index]) {
            int temp = [heap[rootIndex]intValue];
            heap[rootIndex] = heap[index];
            heap[index] = @(temp);
        }
        index = rootIndex;
    }
}

+ (void)heapFirstForArray:(NSMutableArray *)heap {
    int index = 0;
    while (2 * index + 1 < heap.count) {
        int leftSubIndex = 2 * index + 1;
        int rightSubIndex = 2 * index + 2;
        int leftSubValue = [heap[leftSubIndex]intValue];
        int rightSubValue = INT_MAX;
        if (rightSubIndex < heap.count) {
            rightSubValue = [heap[rightSubIndex]intValue];
        }
        
        int minValue = MIN(rightSubValue, leftSubValue);
        int minIndex = leftSubValue == minValue ? leftSubIndex : rightSubIndex;
        if (minValue < [heap[index]intValue]) {
            heap[minIndex] = heap[index];
            heap[index] = @(minValue);
            index = minIndex;
        }else{
            break;
        }
    }
}
@end
