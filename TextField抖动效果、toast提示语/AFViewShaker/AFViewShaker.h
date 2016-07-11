//
//  AFViewShaker
//  AFViewShaker
//
//  Created by Philip Vasilchenko on 03.12.13.
//  Copyright (c) 2014 okolodev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFViewShaker : NSObject

- (instancetype)initWithView:(UIView *)view;//设置单个视图抖动
- (instancetype)initWithViewsArray:(NSArray *)viewsArray;//多个视图抖动

- (void)shake;//抖动方法
- (void)shakeWithDuration:(NSTimeInterval)duration completion:(void (^)())completion;//可设置抖动效果的时间，可在抖动效果结束后进行自己想要的操作

@end