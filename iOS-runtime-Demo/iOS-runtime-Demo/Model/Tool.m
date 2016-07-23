//
//  Tool.m
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "Tool.h"

@interface Tool ()

@property (nonatomic, assign) NSInteger count;

@end

@implementation Tool

+ (instancetype)shareInstance {
    static Tool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[Tool alloc] init];
    });
    return tool;
}

- (NSString *)toolMethod {
    return @"tool Method";
}

- (void)addCount {
    self.count += 1;
    NSLog(@"点击次数 : %zd", self.count);
}

- (NSInteger)count {
    return _count;
}

@end
