//
//  Instance.m
//  yy
//
//  Created by yangyao on 15/9/1.
//  Copyright (c) 2015年 wangding. All rights reserved.
//

#import "Instance.h"

@implementation Instance
+ (Instance *)shaer{
    static Instance *instance = nil;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Instance alloc]init];
    });
    return instance;
}
@end
