//
//  Tool.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "Tool.h"

@interface Tool ()


@end

@implementation Tool

+ (instancetype)shareInstance {
    static Tool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[Tool alloc] init];
        tool.count = 0;
    });
    return tool;
}

- (NSString *)toolMethod {
    return @"tool Method";
}

@end
