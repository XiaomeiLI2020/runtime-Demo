//
//  Tool.h
//  iOS-runtime-Demo
//
//  Created by 雷亮 on 16/7/21.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

+ (instancetype)shareInstance;

- (NSString *)toolMethod;

- (NSString *)changeMethod;

- (void)addCount;

- (NSInteger)count;

@end
