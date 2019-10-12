#  Foundation
## nil
nil 是 ObjC 对象的字面空值，对应 id 类型的对象，或者使用 @interface 声明的 ObjC 对象。
例如：

```
NSString *someString = nil;
NSURL *someURL = nil;
id someObject = nil;

if (anotherObject == nil) // do something
定义：
// objc.h
#ifndef nil
# if __has_feature(cxx_nullptr)
#   define nil nullptr
# else
#   define nil __DARWIN_NULL
# endif
#endif

// __DARWIN_NULL in _types.h

#define __DARWIN_NULL ((void *)0)
```

## Nil

Nil 是 ObjC 类类型的书面空值，对应 Class 类型对象。
例如：
```
Class someClass = Nil;
Class anotherClass = [NSString class];
定义声明和 nil 是差不多的，值相同：
// objc.h
#ifndef Nil
# if __has_feature(cxx_nullptr)
#   define Nil nullptr
# else
#   define Nil __DARWIN_NULL
# endif
#endif
```

## NULL

NULL 是任意的 C 指针空值。
例如：
```
int *pointerToInt = NULL;
char *pointerToChar = NULL;
struct TreeNode *rootNode = NULL;
定义：
// in stddef.h

#define NULL ((void*)0)
```
## NSNull

NSNull 是一个代表空值的类，是一个 ObjC 对象。实际上它只有一个单例方法：+[NSNull null]，一般用于表示集合中值为空的对象。
例子说明：
```
// 因为 nil 被用来用为集合结束的标志，所以 nil 不能存储在 Foundation 集合里。
NSArray *array = [NSArray arrayWithObjects:@"one", @"two", nil];

// 错误的使用
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
[dict setObject:nil forKey:@"someKey"];

// 正确的使用
NSMutableDictionary *dict = [NSMutableDictionary dictionary];
[dict setObject:[NSNull null] forKey:@"someKey"];
定义：
/*  NSNull.h
Copyright (c) 1994-2012, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>

@interface NSNull : NSObject <NSCopying, NSSecureCoding>

+ (NSNull *)null;

@end
```
